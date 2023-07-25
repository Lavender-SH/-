//
//  WordViewController.swift
//  Autolayout
//
//  Created by 이승현 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var wordFirstButton: UIButton!
    
    let wordDictionary: [String: String] = [
        "별다줄": "별거 다 줄인다 입니다",
        "알잘딱깔센": "알아서 잘 딱 깔끔하게 센스있게",
        "jmt": "마시따",
        "JMT": "마시따",
        "꾸안꾸": "꾸민 듯 안 꾸민 듯",
        "내또출": "내일 또 출근",
        "일취월장": "일요일에 취하면 월요일에 장난아님",
        "스불재": "스스로 불러온 재앙",
        "억텐": "억지 텐션",
        "좋댓구알": "좋아요, 댓글, 구독, 알림설정"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordTextField.delegate = self
       // getRandomword()
        wordFirstButton.titleLabel?.font = .systemFont(ofSize: 20)
        wordFirstButton.titleLabel?.textColor = .black
    
        
    }
//    @discardableResult
//    func getRandomword() -> String {
//        let random = ["고래밥","칙촉", "카스타드", "메로나", "월드콘"]
//        let result = random.randomElement()!
//        wordTextField.text = random.randomElement()!
//        print(result)
//        return result
//    }
    // 얼럿 표시 메서드
        func showAlert(message: String) {
            let alert = UIAlertController(title: "주의", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    //버튼 클릭 시 텍스트 필드의 텍스트에 버튼 타이틀이 들어가는 기능
    //1.
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        print(sender.currentTitle)
        //2.
        wordTextField.text = sender.currentTitle
        //3.
        //textFieldKeyboardTapped(wordTextField)
        
        
        let index = sender.tag
        let word = Array(wordDictionary.keys)[index]
        if let meaning = wordDictionary[word] {
            resultLabel.text = meaning }
    }
    
    func searchWord() {
        if let word = wordTextField.text {
            // 입력이 빈칸인지 체크
            guard !word.isEmpty else {
                showAlert(message: "빈 칸을 입력해주세요.")
                return
            }
            
            // 입력이 한 글자 이하인지 체크
            guard word.count >= 2 else {
                showAlert(message: "두 글자 이상 입력해주세요.")
                return
            }
            
            if let meaning = wordDictionary[word] {
                resultLabel.text = meaning
            } else {
                resultLabel.text = "찾는 결과가 없습니다."
            }
    }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                // 검색 기능 수행
                searchWord()

                // 키보드를 숨기기 위해 리턴 키를 누른 후 텍스트 필드의 포커스를 해제
                textField.resignFirstResponder()
                return true
            }
        }
    
    // 입력된 단어를 가져와서 딕셔너리에서 검색하고 결과를 레이블에 표시
        
        func textFieldKeyboardTapped(_ sender: UITextField) {
            print("DidEndOnExit")
            
            switch wordTextField.text {
            case "별다줄": resultLabel.text = "별거 다 줄인다 입니다"
            case "알잘딱깔센": resultLabel.text = "알아서 잘 딱 깔끔하게 센스있게"
            case "jmt", "JMT": resultLabel.text = "마시따"
            case "꾸안꾸": resultLabel.text = "꾸민 듯 안 꾸민 듯"
            case "내또출": resultLabel.text = "내일 또 출근"
            case "일취월장": resultLabel.text = "일요일에 취하면 월요일에 장난아님"
            case "스불재": resultLabel.text = "스스로 불러온 재앙"
            case "억텐": resultLabel.text = "억지 텐션"
            case "좋댓구알": resultLabel.text = "좋아요, 댓글, 구독, 알림설정"
            default: resultLabel.text = "찾는 결과가 없습니다."
            }

        }
        
        //ㅇㅇ
    }
    
