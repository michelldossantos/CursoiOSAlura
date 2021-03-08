//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Michel dos Santos on 01/03/21.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {
    
    private var joao: User!
    private var jose: User!
    private var maria: User!
    var leiloeiro: Avaliador!

    override func setUpWithError() throws {
        joao = User(nome: "João")
        maria = User(nome: "Maria")
        jose = User(nome: "jose")
        leiloeiro = Avaliador()
        
    }

    override func tearDownWithError() throws {
       
    }

    func testDeveEntenderLancesEmOrdemCrescente(){

        let leilao = CriadorLeilao().para(descricao: "Play4").lance(maria, valor: 250)
            .lance(joao, valor: 300)
            .lance(jose, valor: 400)
            .constroi()
       
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(250, leiloeiro.menorLance())
    }
    
    func testDeveEntenderApenasUmLance(){
       
        let leilao = CriadorLeilao().para(descricao: "TV").lance(joao, valor: 1000).constroi()
        
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000, leiloeiro.menorLance())
        XCTAssertEqual(1000, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderApenasUmLanceSeguidoPorUsuário(){
        
        let leilao = CriadorLeilao().para(descricao: "TV").lance(joao, valor: 1000).constroi()
        
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000, leiloeiro.menorLance())
        XCTAssertEqual(1000, leiloeiro.maiorLance())
    }

    func testTresMaioresValores(){
  
        let leilao = CriadorLeilao().para(descricao: "TV 24")
            .lance(joao, valor: 1000)
            .lance(maria, valor: 500)
            .lance(joao, valor: 1500)
            .lance(maria, valor: 2300)
            .lance(joao, valor: 2350)
            .constroi()
        
        
        leiloeiro.avalia(leilao: leilao)
        
        let tresMaiores = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, tresMaiores.count)
        XCTAssertEqual(2350, tresMaiores[0].valor)
        XCTAssertEqual(2300, tresMaiores[1].valor)
        XCTAssertEqual(1500, tresMaiores[2].valor)
        
    }
}
