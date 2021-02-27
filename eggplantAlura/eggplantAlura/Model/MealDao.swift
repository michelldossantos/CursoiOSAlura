//
//  MealDao.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 20/02/21.
//

import Foundation


class MealDao {
    
    func saveMeal(_ meals: [Meals]){
        
        guard let way = restoreWay() else {return}
        
        do{
            let date = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try date.write(to: way)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func recoverMeals() -> [Meals]{
        
        guard let way = restoreWay() else {return []}
        do{
            let date = try Data(contentsOf: way)
            guard let mealsSaved = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(date) as? [Meals] else {return []}
            return mealsSaved
     
        }catch{
            print(error.localizedDescription)
            return []
        }
        
        
    }
    
    func restoreWay() -> URL?{
        
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return directory.appendingPathComponent("meals")
    }
}
