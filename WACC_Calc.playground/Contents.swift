import UIKit


func CFCulc(amountOfSales: Double,
            rawMaterialCosts: Double,
            laborCosts: Double,
            saleCost: Double,
            interestRate: Double,
            purchasePrice: Double,
            borrowingAmount: Double
){
    //CF
    let operatingCF = amountOfSales - rawMaterialCosts - laborCosts
    let investmentCF = saleCost
    let freeCF = operatingCF + investmentCF

    //債権者
    let x = purchasePrice - borrowingAmount

    let paymenToCreditors = x * (1 + interestRate)
    let returnToCreditors = paymenToCreditors - x
    let creditorRateOfReturn = returnToCreditors / x

    //株主
    let dividendsToShareholders = freeCF - paymenToCreditors
    let returnToShareholders = dividendsToShareholders  - x
    let rateOfReturnOfShareholders = returnToShareholders / x

    //財務CF
    let financeCF = paymenToCreditors + dividendsToShareholders

    print("営業CF: \(operatingCF)万円")
    print("投資CF: \(investmentCF)万円")
    print("フリーCF: \(freeCF)万円")
    print("財務CF: \(financeCF)万円")
    print("債権者への支払い: \(paymenToCreditors)万円")
    print("債権者のリターン: \(returnToCreditors)万円")
    print("債権者の収益率: \(creditorRateOfReturn * 100) %")
    print("株主への配当: \(dividendsToShareholders)万円")
    print("株主のリターン: \(returnToShareholders)万円   ")
    print("株主の収益率: \(rateOfReturnOfShareholders * 100) %")

}

//1
CFCulc(amountOfSales: <#T##Double#>, rawMaterialCosts: <#T##Double#>, laborCosts: <#T##Double#>, saleCost: <#T##Double#>, interestRate: <#T##Double#>, purchasePrice: <#T##Double#>, borrowingAmount: <#T##Double#>)
print("--------")


func waccCalc(corporateBounds: Double, marketCapitalization: Double, riskFreeRate: Double, beta: Double, marketRiskPremium: Double, debtCost: Double){

    //負債コスト: 社債の利回り
    let debtCost = debtCost * 100
    print("負債コスト: \(debtCost)%")

    //負債比率
    let debtRaito = corporateBounds / (corporateBounds + marketCapitalization)
    print("負債比率: \(debtRaito)")

    //CAPM:株式コスト
    let capm = (riskFreeRate + beta * marketRiskPremium) * 100
    print("株式コスト: \(capm)%")

    //株式比率
    let stockRaito = marketCapitalization / (corporateBounds + marketCapitalization)
    print("株式比率:\(stockRaito)")

    //WACC
    let wacc = debtCost * debtRaito + capm * stockRaito

    print("WACC: \(wacc)%")
}

//2
waccCalc(corporateBounds: <#T##Double#>, marketCapitalization: <#T##Double#>, riskFreeRate: <#T##Double#>, beta: <#T##Double#>, marketRiskPremium: <#T##Double#>, debtCost: <#T##Double#>)
print("--------")



func stockValueationCalc(g: Double, d: Double, riskFreeRate: Double, marketRiskPremium: Double, beta: Double){
    let stockValue = riskFreeRate + beta * marketRiskPremium
    let ddm = d / (stockValue - g)
    let stockValueation = ddm

    print("配当成長率: \(g * 100)%")
    print("来期の配当: \(d)円")
    print("株式基本コスト: \(stockValue * 100)%")
    print("理論株価（株式評価額）: \(stockValueation)円")
}

stockValueationCalc(g: <#T##Double#>, d: <#T##Double#>, riskFreeRate: <#T##Double#>, marketRiskPremium: <#T##Double#>, beta: <#T##Double#>)
print("---------")


func sustainableGrowthRateCalc(dividendPayoutrRatio: Double, roe: Double){
    let roe2 = roe * 100
    let reinvestmentRatio = 1.0 - dividendPayoutrRatio
    let sustainableGrowthRate = reinvestmentRatio * roe2
    print("配当性向: \(dividendPayoutrRatio)")
    print("再投資比率: \(reinvestmentRatio)")
    print("ROE: \(roe2)%")
    print("サステイナブル成長率\(sustainableGrowthRate)%")
}

//4
sustainableGrowthRateCalc(dividendPayoutrRatio: <#T##Double#>, roe: <#T##Double#>)
print("--------")



func corporateValueEvaluationCalc(fcf:Double, interest:Double, divident:Double, debtCost:Double, stockCost:Double){
    let debtValue = interest / debtCost
    let stockValue = divident / stockCost
    let wacc = (debtValue / (debtValue + stockValue) * debtCost) + (stockValue / (debtValue + stockValue) * stockCost)
    let corporateValueEvaluation1 = debtValue + stockValue
    let corporateValueEvaluation2 = fcf / wacc


//    fcf = 営業CF ＋　投資CF
    print("売上高営業利益FCF: \(fcf)")
    print("利子: \(interest)")
    print("配当: \(divident)")
    print("負債コスト: \(debtCost * 100)%")
    print("株式コスト: \(stockCost * 100)%")
    print("負債価値: \(debtValue)")
    print("株式価値: \(stockValue)")
    print("WACC: \(wacc * 100)%")
    print("企業価値評価額(負債価値＋株式価値): \(corporateValueEvaluation1)")
    print("企業価値評価額(FCF/WACC): \(corporateValueEvaluation2 * 100)")

}

//5
corporateValueEvaluationCalc(fcf: <#T##Double#>, interest: <#T##Double#>, divident: <#T##Double#>, debtCost: <#T##Double#>, stockCost: <#T##Double#>)
print("--------")


func capmCalc(riskFreeRate: Double, beta: Double, marketRiskPremium: Double){
    let capm = riskFreeRate + beta * marketRiskPremium
    print("CAPM: \(capm * 100)%")
}
capmCalc(riskFreeRate: <#T##Double#>, beta: <#T##Double#>, marketRiskPremium: <#T##Double#>)
