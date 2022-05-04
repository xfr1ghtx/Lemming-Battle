//
//  MainViewController.swift
//  LemmingBattle
//
//  Created by Stepan Potapov on 03.05.2022.
//

import UIKit
import SnapKit
import TPKeyboardAvoiding

class MainViewController: UIViewController {
    
    private let scrollView = TPKeyboardAvoidingScrollView()
    private let contentView = UIView()
    private let countLabel = UILabel()
    private let countTextField = UITextField()
    private let greenArmyLabel = UILabel()
    private let greenArmyTextField = UITextField()
    private let blueArmyLabel = UILabel()
    private let blueArmyTextField = UITextField()
    private let buttonStackView = UIStackView()
    private let fightButton = UIButton()
    private let resetButton = UIButton()
    private let resultLabel = UILabel()

    private let textFieldWidth = 150
    private let textFieldHeight = 40
    
    
    private var viewModel: MainViewModel!

    //MARK: - Inits

    init(viewModel: MainViewModel){
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindToViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        present(UIAlertController.createAlert(withTitle: "Hi", message: "Enter the count of battlefield and the sizes of the green and blue army. It must be a number or numbers separated by a space."), animated: true)
    }
    
    //MARK: - Actions
    
    @objc private func tapOnFightButton(){
        viewModel.letsFight(countOfBattlefields: countTextField.text, greenArmy: greenArmyTextField.text, blueArmy: blueArmyTextField.text)
    }
    
    @objc private func tapOnResetButton(){
        countTextField.text = ""
        greenArmyTextField.text = ""
        blueArmyTextField.text = ""
        resultLabel.text = ""
    }
    
    private func bindToViewModel(){
        viewModel.DidFightIsOver = {[weak self] result in
            self?.resultLabel.text = result
        }
        
        viewModel.DidFindError = {[weak self] message in
            self?.present(UIAlertController.createAlert(withTitle: "Error", message: message), animated: true)
        }
    }
    
    //MARK: - Setups
    
    private func setup(){
        superViewSetup()
        scrollViewSetup()
        countLabelSetup()
        countTextFieldSetup()
        greenArmyLabelSetup()
        greenArmyTextFieldSetup()
        blueArmyLabelSetup()
        blueArmyTextFieldSetup()
        buttonStackViewSetup()
        fightButtonSetup()
        resetButtonSetup()
        resultLabelSetup()
    }
    
    private func superViewSetup(){
        view.backgroundColor = .white
    }
    
    private func scrollViewSetup(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.keyboardDismissMode = .interactive
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{make in
            make.edges.equalTo(scrollView)
            make.width.equalToSuperview()
            make.height.equalTo(425)
        }
    }
    
    private func countLabelSetup(){
        contentView.addSubview(countLabel)
        
        countLabel.text = "Count Of Battlefields"
        countLabel.textAlignment = .center
        countLabel.font = .boldSystemFont(ofSize: 20)
        countLabel.textColor = .black
        
        countLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func countTextFieldSetup(){
        contentView.addSubview(countTextField)
        
        countTextField.autocorrectionType = .no
        countTextField.backgroundColor = .systemGray
        countTextField.textAlignment = .center
        countTextField.font = .boldSystemFont(ofSize: 16)
        countTextField.keyboardType = .numbersAndPunctuation
        countTextField.text = "10"
        countTextField.textColor = .black
        
        countTextField.snp.makeConstraints{make in
            make.top.equalTo(countLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(textFieldWidth)
            make.height.equalTo(textFieldHeight)
        }
    }
    
    private func greenArmyLabelSetup(){
        contentView.addSubview(greenArmyLabel)
        
        greenArmyLabel.text = "Green Army"
        greenArmyLabel.textAlignment = .center
        greenArmyLabel.font = .boldSystemFont(ofSize: 20)
        greenArmyLabel.textColor = .black
        
        greenArmyLabel.snp.makeConstraints{ make in
            make.top.equalTo(countTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func greenArmyTextFieldSetup(){
        contentView.addSubview(greenArmyTextField)
        
        greenArmyTextField.autocorrectionType = .no
        greenArmyTextField.backgroundColor = .systemGreen
        greenArmyTextField.textAlignment = .center
        greenArmyTextField.font = .boldSystemFont(ofSize: 16)
        greenArmyTextField.keyboardType = .numbersAndPunctuation
        greenArmyTextField.text = "5 5"
        greenArmyTextField.textColor = .black
        
        greenArmyTextField.snp.makeConstraints {make in
            make.top.equalTo(greenArmyLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(textFieldWidth)
            make.height.equalTo(textFieldHeight)
        }
        
    }
    
    private func blueArmyLabelSetup(){
        contentView.addSubview(blueArmyLabel)
        
        blueArmyLabel.text = "Blue Army"
        blueArmyLabel.textAlignment = .center
        blueArmyLabel.font = .boldSystemFont(ofSize: 20)
        blueArmyLabel.textColor = .black
        
        blueArmyLabel.snp.makeConstraints{make in
            make.top.equalTo(greenArmyTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func blueArmyTextFieldSetup(){
        contentView.addSubview(blueArmyTextField)
        
        blueArmyTextField.autocorrectionType = .no
        blueArmyTextField.backgroundColor = .systemBlue
        blueArmyTextField.textAlignment = .center
        blueArmyTextField.font = .boldSystemFont(ofSize: 16)
        blueArmyTextField.keyboardType = .numbersAndPunctuation
        blueArmyTextField.text = "5 5"
        blueArmyTextField.textColor = .black
        
        blueArmyTextField.snp.makeConstraints{ make in
            make.top.equalTo(blueArmyLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(textFieldWidth)
            make.height.equalTo(textFieldHeight)
        }
    }
    
    private func buttonStackViewSetup(){
        contentView.addSubview(buttonStackView)
        
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 60
        buttonStackView.distribution = .fillEqually
        
        buttonStackView.snp.makeConstraints{make in
            make.top.equalTo(blueArmyTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(90)
        }
    }
    
    private func fightButtonSetup(){
        buttonStackView.addArrangedSubview(fightButton)
        
        fightButton.setTitle("Fight!", for: .normal)
        fightButton.setTitleColor(.black, for: .normal)
        fightButton.backgroundColor = .systemRed
        fightButton.layer.cornerRadius = 45
        fightButton.addTarget(self, action: #selector(tapOnFightButton), for: .touchUpInside)
    }
    
    private func resetButtonSetup(){
        buttonStackView.addArrangedSubview(resetButton)
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.black, for: .normal)
        resetButton.backgroundColor = .systemPurple
        resetButton.layer.cornerRadius = 45
        
        resetButton.addTarget(self, action: #selector(tapOnResetButton), for: .touchUpInside)
    }
    
    private func resultLabelSetup(){
        contentView.addSubview(resultLabel)
        
        resultLabel.text = ""
        resultLabel.textAlignment = .center
        resultLabel.font = .boldSystemFont(ofSize: 22)
        resultLabel.textColor = .black
        
        resultLabel.snp.makeConstraints{ make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
