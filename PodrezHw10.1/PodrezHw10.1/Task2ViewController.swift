
import UIKit
import SnapKit

class SecondTask2ViewController: UIViewController {

    var healthyFood: HealthyFood?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Healthy Food"
        
        guard let healthyFood = healthyFood else { return }
        
        let labelName = UILabel()
        let labelCount = UILabel()
        let labelTruth = UILabel()
        
        labelName.text = "Food name is: \(healthyFood.name)"
        labelCount.text = "Amount: \(healthyFood.count)"
        labelTruth.text = "Is it Healthy? \(healthyFood.healthy ? "Yes" : "No")"
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelCount.translatesAutoresizingMaskIntoConstraints = false
        labelTruth.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelName)
        view.addSubview(labelCount)
        view.addSubview(labelTruth)
        
        labelName.snp.makeConstraints { make in
            make.leading.equalTo(view)
            make.top.equalToSuperview().offset(150)
        }
        labelCount.snp.makeConstraints { make in
            make.leading.equalTo(view)
            make.top.equalTo(labelName.snp.bottom).offset(15)
        }
        labelTruth.snp.makeConstraints { make in
            make.leading.equalTo(view)
            make.top.equalTo(labelCount.snp.bottom).offset(15)
        }
    }
}
