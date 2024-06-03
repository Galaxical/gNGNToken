# GAME-W3-6: NaijaFlip Memory Card Game

##  Background
There is a rising issue concerning the country’s financial sector. To solve this, the government decided to move its financial system to the Blockchain for better transparency and accountability.

##  The Task

You were thereby contracted by the Central Bank governor to build a solution to solve these problems leveraging blockchain technologies. The project will be called G-Naira(gNGN).


## GETTING STARTED

These instructions will help you set up the NaijaFlip project on your local machine for development and testing purposes.

## PRE-REQUISITE

To develop the blockchain shuflling mechanism on NaijaFlip, you will need the following;

+ Node.js
+ Solidity
+ Hardhat
+ Visual Studio Code (or any preferred code editor)
+ Web3.js or ethers.js
+ Metamask extension for your browser

## SETTING UP YOUR VIRTUAL ENVIRONMENT (INSTALLATIONS)

The following steps will get your virtual environment running

1. create a project directory

```
mkdir GNGNTOKEN
```

2. Navigate to project directory

```
cd GNGNTOKEN
```

3. Initiate Git repository

```
git init
```

4. Branch out to your suitable branch on the repo

```
git checkout -b <your branch name>
```

5. Install node.js

```
npm init
```

6. Install hardhat

```
npm install --save-dev hardhat
```

7. In the same directory, initialize hardhat

```
npx hardhat init
```

and select

```
create a javascript project
```

8. Install hardhat plugin for holistic integration

```
npm install --save-dev @nomicfoundation/hardhat-toolbox
```

9. Compile smart contract with hardhat

```
npx hardhat compile
```

10. Install ethers.js for web3 interaction

```
npm install ethers
```

11. Import @openzepplin/contracts/ERC20

```
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol"
```

12. Using add, commit, and push
```
git add .
git commit -m "commit message"
git push origin <branchName>
```

Now you have your environment totally setup and ready for development
