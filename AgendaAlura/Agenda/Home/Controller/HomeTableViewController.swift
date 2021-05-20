//
//  HomeTableViewController.swift
//  Agenda
//
//  Created by Ândriu Coelho on 24/11/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit
import CoreData
import SafariServices 

@available(iOS 13.0, *)
class HomeTableViewController: UITableViewController, UISearchBarDelegate, NSFetchedResultsControllerDelegate {
    
    //MARK: - Variáveis
    
    let searchController = UISearchController(searchResultsController: nil)
    var gerenciadorDeResultados: NSFetchedResultsController<Aluno>?
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    var alunoViewController: AlunoViewController?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuraSearch()
        recuperaAluno()
        tableView.reloadData()
    }
    
    // MARK: - Métodos
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editar" {
            alunoViewController = segue.destination as? AlunoViewController
        }
    }
    
    func configuraSearch() {
        self.searchController.searchBar.delegate = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
    
    func recuperaAluno(_ filtro: String = "" ){
        
        let pesquisaAluno: NSFetchRequest<Aluno> = Aluno.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "nome", ascending: true)
        pesquisaAluno.sortDescriptors = [ordenaPorNome]
        
        if podeFiltrar(filtro) {
            pesquisaAluno.predicate = filtraAluno(filtro)
        }
        
        
        
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaAluno, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        gerenciadorDeResultados?.delegate = self
        
        do{
            try  gerenciadorDeResultados?.performFetch()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func filtraAluno(_ filtro: String) -> NSPredicate {
        return NSPredicate(format: "nome CONTAINS %@", filtro)
    }
    
    func podeFiltrar(_ filtro: String) -> Bool {
        
        if filtro.isEmpty {
            return false
        }
        
        return true
    }
    
    @objc func abrirActionSheet(_ longPress: UILongPressGestureRecognizer) {
        
        if longPress.state == .began {
            guard let alunoSelecionado = gerenciadorDeResultados?.fetchedObjects?[(longPress.view?.tag)!] else { return }
            let menu = MenuOpcoesAluno().configuraMenuOpcoesDoAluno(completion: { (opcao) in
                switch opcao {
                case .sms:
                  print("sms")
                    break
                case .ligacao:
                    guard let numeroDoAluno = alunoSelecionado.telefone else { return }
                    if let url = URL(string: "tel://\(numeroDoAluno)"), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    break
                case .waze:
                    if UIApplication.shared.canOpenURL(URL(string: "waze://")!) {
                        guard let enderecoDoAluno = alunoSelecionado.endereco else { return }
                        Localizacao().converteEnderecoEmCordenadas(endereco: enderecoDoAluno, local: { (localizacaoEncontrada) in
                            let latitude = String(describing: localizacaoEncontrada.location!.coordinate.latitude)
                            let longitude = String(describing: localizacaoEncontrada.location!.coordinate.longitude)
                            let url:String = "waze://?ll=\(latitude),\(longitude)&navigate=yes"
                                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
                        })
                    }
                    break
                   
                case .mapa:
                    let mapa = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "mapa") as! MapaViewController
                    mapa.aluno = alunoSelecionado
                    self.navigationController?.pushViewController(mapa, animated: true)
                case .abrirPaginaWeb:
                    
                    if let url = alunoSelecionado.site {
                        
                        var urlFormatada = url
                        
                        if !urlFormatada.hasPrefix("http://") {
                            urlFormatada = "http://\(urlFormatada)"
                        }
                        guard let url = URL(string: urlFormatada) else {return}
                        let safariViewController = SFSafariViewController(url: url)
                        self.present(safariViewController, animated: true, completion: nil)
                    }
                    
                    break
                }
            })
            self.present(menu, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let alunos = gerenciadorDeResultados?.fetchedObjects?.count else {return 0}
        
        return alunos
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula-aluno", for: indexPath) as! HomeTableViewCell
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(abrirActionSheet(_:)))
        
        guard let aluno = gerenciadorDeResultados?.fetchedObjects![indexPath.row] else { return cell }
        
        cell.configuracell(aluno)
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            AutenticacaoLocal().autorizaUsuario { autenticado in
                if autenticado {
                    DispatchQueue.main.async {
                        guard let alunoSelecionado = self.gerenciadorDeResultados?.fetchedObjects![indexPath.row] else { return  }
                        self.contexto.delete(alunoSelecionado)
                        
                        do {
                            try self.contexto.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                   
                }
            }
            
           
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let alunoSelecinado = gerenciadorDeResultados?.fetchedObjects?[indexPath.row] else { return  }
        
        alunoViewController?.aluno = alunoSelecinado
        
        
    }
    
    //MARK: - NSFetchedResultsControllerDelegate
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            guard let indexPath = indexPath else { return  }
            tableView.deleteRows(at: [indexPath], with: .fade)
            break
        default:
            tableView.reloadData()
        }
    }
    
    @IBAction func ButtonCalculaMedia(_ sender: UIBarButtonItem) {
        
        
    }
    
    @IBAction func buttonLocalixacaoGeral(_ sender: UIBarButtonItem) {
        
        let mapa = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "mapa") as! MapaViewController
        
        navigationController?.pushViewController(mapa, animated: true)
        
    }
    
    
    
    //MARK: Search Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let nomeAluno = searchBar.text else { return}
        recuperaAluno(nomeAluno)
        tableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        recuperaAluno()
        tableView.reloadData()
    }
}
