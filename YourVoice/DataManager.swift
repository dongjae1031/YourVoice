//
//  DataManager.swift
//  YourVoice
//
//  Created by 이동재 on 27/05/2019.
//  Copyright © 2019 이동재. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    func deleteMemo(_ memo: Memo?){
        if let memo=memo{
            mainContext.delete(memo)
            saveContext()
        }
    }
    
    var memoList = [Memo]()
    
    func fetchMemo(){
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        do{
            memoList = try mainContext.fetch(request)
        } catch{
            print(error)
        }
    }
    
    func addNewMemo(_ memo: String?){
        let newMemo = Memo(context: mainContext)
        newMemo.content = memo
        newMemo.insertDate=Date()
        saveContext()
    }
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourVoice")
        container.loadPersistentStores(completionHandler:
            {
                (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresilved error \(error), \(error.userInfo)")
                }
        })
        return container
    }()
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do{
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
