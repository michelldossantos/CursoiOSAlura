//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Michel dos Santos on 27/02/21.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {

    var steveJobs: User!
    var bilGates: User!
    
    override func setUpWithError() throws {
         steveJobs = User(nome: "Steve Jobs")
         bilGates = User(nome: "Bil Gates")
    }

    override func tearDownWithError() throws {
     
    }

    func testReceberUmLance(){
  
        let leilao = CriadorLeilao().para(descricao: "MacBook Pro 15")
            .lance(bilGates, valor: 5000)
            .constroi()
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(5000, leilao.lances?.first?.valor)
    }
    
    func testignorarDoisLancesSeguidosDoMesmoUser(){
        let leilao = CriadorLeilao().para(descricao: "MacBook 15 pro")
            .lance(steveJobs, valor: 2000)
            .lance(steveJobs, valor: 2500)
            .constroi()
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000, leilao.lances?.first?.valor)
    }
    
    func testReceberSomenteCincoLancesDoMesmoUser(){
    
        let leilao = CriadorLeilao().para(descricao: "MacBook 15 pro")
            .lance(steveJobs, valor: 2000)
            .lance(bilGates, valor: 2500)
            .lance(steveJobs, valor: 3000)
            .lance(bilGates, valor: 3500)
            .lance(steveJobs, valor: 4000)
            .lance(bilGates, valor: 4500)
            .lance(steveJobs, valor: 5000)
            .lance(bilGates, valor: 5500)
            .lance(steveJobs, valor: 6000)
            .lance(bilGates, valor: 6500)
            .lance(steveJobs, valor: 7000)
            .constroi()
            
        XCTAssertEqual(10, leilao.lances?.count)
        XCTAssertEqual(6500, leilao.lances?.last?.valor)

    }
}
