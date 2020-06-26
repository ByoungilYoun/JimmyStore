import Foundation

final class DataProvider {
    internal static func getMerchandises() -> [MerchandiseCategory] {
        var items = [MerchandiseCategory]()
        
//        let cateMacBookPro13 = DataProvider.getMerchandise_MacBookPro13()
//        let cateMacBookPro16 = DataProvider.getMerchandise_MacBookPro16()
//        let cateMacBookAir = DataProvider.getMerchandise_MacBookAir()
//        let cateiMac21_5 = DataProvider.getMerchandise_iMac21_5()
//        let cateiMac27 = DataProvider.getMerchandise_iMac27()
//        let cateiMacPro = DataProvider.getMerchandise_iMacPro()
//        let cateMacPro = DataProvider.getMerchandise_MacPro()
//        let cateMacMini = DataProvider.getMerchandise_MacMini()
//
//        items.append(cateMacBookPro13)
//        items.append(cateMacBookPro16)
//        items.append(cateMacBookAir)
//        items.append(cateiMac21_5)
//        items.append(cateiMac27)
//        items.append(cateiMacPro)
//        items.append(cateMacPro)
//        items.append(cateMacMini)
        
        let cateMac = DataProvider.getMerchandise_Mac()
        let cateiPhone = DataProvider.getMerchandise_iPhone()
        let cateiPad = DataProvider.getMerchandise_iPad()
        let cateAppleWatch = DataProvider.getMerchandise_AppleWatch()
        let cateAirPods = DataProvider.getMerchandise_AirPods()
        
        items.append(cateMac)
        items.append(cateiPhone)
        items.append(cateiPad)
        items.append(cateAppleWatch)
        items.append(cateAirPods)
        
        return items
    }
    
    
    private static func getMerchandise_Mac() -> MerchandiseCategory {
        let categoryName = "Mac"
        let category = MerchandiseCategory(name: categoryName)
        category.append(Merchandise(categoryName: categoryName,
                                    name: "MacBook Air",
                                    imageName: "MacBook Air",
                                    price: 1320000,
                                    description: "1.1GHz 듀얼 코어 Core i3 프로세서(최대 3.2GHz Turbo Boost)256GB 저장 용량Touch ID \n" ))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "MacBook Pro",
                                    imageName: "MacBook Pro",
                                    price: 1720000,
                                    description: "2.6GHz 6코어 프로세서 512GB 저장 용량 AMD Radeon Pro 5300M"))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iMac",
                                    imageName: "iMac",
                                    price: 1440000,
                                    description: "2.3GHz 듀얼 코어 프로세서(최대 3.6GHz Turbo Boost) 1TB 저장 용량"))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iMac Pro",
                                    imageName: "iMac Pro",
                                    price: 6300000,
                                    description: "3.2GHz 8코어 Intel Xeon W 프로세서최대 4.2GHz Turbo Boost, 32GB 2666MHz ECC 메모리, 최대 256GB로 구성 가능, 1TB SSD 저장 장치¹ , Radeon Pro Vega 56(8GB HBM2 메모리), 10Gb Ethernet, Thunderbolt 3 포트 4개, 27형 Retina 5K 5120 x 2880 P3 디스플레이"))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "Mac Pro",
                                    imageName: "Mac Pro",
                                    price: 7899000,
                                    description: "3.5GHz 8코어 Intel Xeon W 프로세서(최대 4.0GHz Turbo Boost) ,32GB(4x8GB) DDR4 ECC 메모리 ,Radeon Pro 580X(8GB GDDR5 메모리) , 256GB SSD 저장 장치 , 발판 달린 스테인리스 스틸 프레임, Magic Mouse 2, Magic Keyboard with Numeric Keypad - 한국어"))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "Mac mini",
                                    imageName: "Mac Mini",
                                    price: 1040000,
                                    description: "3.6GHz 쿼드 코어 8세대 Intel Core i3 프로세서, 8GB 2666MHz DDR4 메모리, Intel UHD Graphics 630, 256GB PCIe 기반 SSD 저장 장치¹"))
        
        return category
    }
    
    private static func getMerchandise_iPhone() -> MerchandiseCategory {
        let categoryName = "iPhone"
        let category = MerchandiseCategory(name: categoryName)
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iPhone Pro",
                                    imageName: "iPhone Pro 11",
                                    price: 1390000,
                                    description: "복잡함은 빼고 엄청난 성능만을 더해 사진 촬영의 개념 자체를 바꾸는 트리플 카메라 시스템. 배터리 사용 시간의 전례 없는 도약. 머신 러닝의 잠재력을 더욱 끌어올리고, 스마트폰의 영역을 확장하는 가공할 성능의 칩. Pro라는 이름에 전혀 손색 없는 강력한 최초의 iPhone, 지금 소개합니다."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iPhone 11",
                                    imageName: "iPhone 11",
                                    price: 990000,
                                    description: "새로운 듀얼 카메라 시스템은 소중한 순간들을 더욱 넓은 장면으로 포착할 수 있게 해줍니다. 스마트폰 사상 가장 빠른 칩과 온종일 가는 배터리 덕분에 충전을 자주 안 해도 더욱 많은 일들을 해낼 수 있죠. 여기에 스마트폰 사상 최고 퀄리티의 동영상을 찍을 수 있기 때문에, 당신의 추억들을 그 어느 때보다 선명하고 아름답게 기록할 수 있습니다."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iPhone XR",
                                    imageName: "iPhone XR",
                                    price: 850000,
                                    description: "싱글 카메라 시스템(와이드), 최대 16시간 동영상 재생1, 최대 수심 1m에서, 최대 30분 생활 방수2, 6.1형 Liquid Retina HD 디스플레이3"))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iPhone SE",
                                    imageName: "iPhone SE",
                                    price: 550000,
                                    description: "싱글 카메라 시스템(와이드), 최대 13시간 동영상 재생1, 최대 수심 1m, 최대 30분 생활 방수2, 4.7형 Retina HD 디스플레이"))
        
        return category
    }
    
    private static func getMerchandise_iPad() -> MerchandiseCategory {
        let categoryName = "iPad"
        let category = MerchandiseCategory(name: categoryName)
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iPad Pro",
                                    imageName: "iPad Pro",
                                    price: 1029000,
                                    description: "모습은 사뭇 한 장의 신기한 유리판, 그러나 대부분의 노트북 PC가 따라오지 못할 만큼의 속도를 자랑합니다. 현실 세계를 송두리째 바꿀 프로급 카메라도 장착했습니다. 터치, 펜슬, 키보드, 여기에 이젠 트랙패드로도 다룰 수 있습니다. 바로 iPad Pro입니다."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iPad Air",
                                    imageName: "iPad Air",
                                    price: 629000,
                                    description: "Neural Engine을 탑재한 A12 Bionic 칩, True Tone을 갖춘 10.5형 Retina 디스플레이, 여기에 Apple Pencil 및 Smart Keyboard 지원까지. iPad Air는 Apple의 가장 강력한 기술로 가득할 뿐만 아니라, 이를 그 어느 때보다 많은 사람이 누릴 수 있게 해줍니다. 게다가 무게는 500g이 채 안 되고, 두께는 6.1mm에 불과하다 보니 막강한 힘을 어디라도 가뿐하게 들고 다니는 셈이죠."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iPad",
                                    imageName: "iPad",
                                    price: 449000,
                                    description: "컴퓨터에 버금가는 성능과 역량은 물론, 컴퓨터로는 상상할 수 없는 간편한 사용성과 다재다능함까지 갖춘 새로운 iPad. 더 커진 10.2형 Retina 디스플레이, 풀사이즈 Smart Keyboard 지원, iPadOS의 놀랍고 새로운 기능들 덕분에 그 활용성이 더욱더 확장되었습니다. 무엇을 하든 엄청난 즐거움을 선사하는 iPad의 본질은 그대로인 채 말이죠."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "iPad mini",
                                    imageName: "iPad Mini",
                                    price: 449000,
                                    description: "아담한 크기와 강력한 성능으로 많은 사랑을 받는 iPad mini. 이제 그런 iPad mini를 사랑하게 될 이유가 더 많아졌습니다. Neural Engine을 탑재한 A12 Bionic 칩, True Tone을 갖춘 7.9형 Retina 디스플레이까지. 여기에 이제 Apple Pencil도 지원해, 번뜩이는 아이디어가 떠오를 때마다 놓치지 않고 적어둘 수 있죠. 크기는 여전히 미니, 하지만 그 안에는 그 어느 때보다 크나큰 파워가 담겼습니다."))
        
        return category
    }
    
    private static func getMerchandise_AppleWatch() -> MerchandiseCategory {
        let categoryName = "Apple Watch"
        let category = MerchandiseCategory(name: categoryName)
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "Apple Watch Series 5",
                                    imageName: "Apple Watch Series 5",
                                    price: 539000,
                                    description: "지금까지의 Apple Watch 중 가장 앞선 모델. 상시표시형 Retina 디스플레이, ‘국제 긴급 구조 요청’ 및 ‘넘어짐 감지’ 기능 그리고 내장 나침반까지."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "Apple Watch Nike",
                                    imageName: "Apple Watch Nike",
                                    price: 539000,
                                    description: "스포츠로 하나 되다. Apple Watch Nike의 진가는 Nike Run Club 앱과 함께 사용할 때 비로소 드러납니다. Nike Run Club 앱은 수많은 훈련 방식과 적절한 코칭 및 동기 부여를 통해 당신의 운동을 더 높은 단계로 끌어올려주죠. 게다가 Apple Watch Series 5의 경우, 모든 Nike 시계 페이스가 상시표시형 Retina 디스플레이에 최적화되어 있습니다."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "Apple Watch Hermès",
                                    imageName: "Apple Watch Hermes",
                                    price: 1499000,
                                    description: "깊이가 다른 협업. 인상적인 컬렉션. 수평적 사고와 공통의 가치관을 바탕으로 맺어진 양사의 파트너십, 올해도 멈추지 않습니다. 다채로운 Hermès 케이스와 밴드, 상시표시형 Retina 디스플레이에 맞게 디자인된 페이스까지. 세련미 넘치는 Apple Watch Hermès는 스타일리시한 현대인을 위한 궁극의 도구입니다."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "Apple Watch Series 3",
                                    imageName: "Apple Watch Series 3",
                                    price: 259000,
                                    description: "건강한 삶을 위한 궁극의 기기. Apple Watch의 핵심인 피트니스, 심박수 모니터링 그리고 연결 기능 탑재. 게다가 부담 없는 가격까지."))
        
        return category
    }
    
    private static func getMerchandise_AirPods() -> MerchandiseCategory {
        let categoryName = "Air Pods"
        let category = MerchandiseCategory(name: categoryName)
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "AirPods Pro",
                                    imageName: "AirPods Pro",
                                    price: 329000,
                                    description: "온전히 빠져들게 하는 액티브 노이즈 캔슬링. 주변의 소리를 들려주는 주변음 허용 모드. 온종일 편안한 맞춤형 핏. 새롭게 귓가를 찾아온 매혹."))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "AirPods 무선 충전 케이스 모델",
                                    imageName: "AirPods wireless charge",
                                    price: 249000,
                                    description: "Apple 자체 디자인, 자동으로 켜지고, 자동으로 연결, 간편한 설정으로 당신의 모든 Apple 기기와 셋업 완료6 Siri야라고 부르거나 두 번 탭해서 간편하게 Siri 사용, 두 번 탭해서 재생 또는 건너뛰기, 케이스에서 빠르게 충전, 풍부한 고음질 오디오 및 음성"))
        
        category.append(Merchandise(categoryName: categoryName,
                                    name: "AirPods 충전 케이스 모델",
                                    imageName: "AirPods",
                                    price: 199000,
                                    description: "Apple 자체 디자인, 자동으로 켜지고,자동으로 연결, 간편한 설정으로 당신의 모든 Apple 기기와 셋업 완료6 Siri야라고 부르거나 두 번 탭해서 간편하게 Siri 사용, 두 번 탭해서 재생 또는 건너뛰기, 케이스에서 빠르게 충전, 풍부한 고음질 오디오 및 음성"))
        
        return category
    }
    
    
    
//    private static func getMerchandise_MacBookPro13() -> MerchandiseCategory {
//        let result = MerchandiseCategory(name: "MacBook Pro 13형")
//        result.append(Merchandise(name: "MacBook Pro 13형 type-1",
//                                  imageName: "",
//                                  price: 1720000,
//                                  description: "1.4GHz 쿼드 코어 프로세서"))
//
//        result.append(Merchandise(name: "MacBook Pro 13형 type-2",
//                                  imageName: "",
//                                  price: 1990000,
//                                  description: "1.4GHz 쿼드 코어 프로세서"))
//
//        result.append(Merchandise(name: "MacBook Pro 13형 type-3",
//                                  imageName: "",
//                                  price: 2490000,
//                                  description: "2.0GHz 쿼드 코어 프로세서"))
//
//        return result
//    }
//
//    private static func getMerchandise_MacBookPro16() -> MerchandiseCategory {
//        let result = MerchandiseCategory(name: "MacBook Pro 16형")
//        result.append(Merchandise(name: "MacBook Pro 16형 type-1",
//                                  imageName: "",
//                                  price: 3190000,
//                                  description: "2.6GHz 6코어 프로세서"))
//
//        result.append(Merchandise(name: "MacBook Pro 16형 type-1",
//                                  imageName: "",
//                                  price: 3690000,
//                                  description: "2.3GHz 8코어 프로세서"))
//
//        return result
//    }
//
//    private static func getMerchandise_MacBookAir() -> MerchandiseCategory {
//        let result = MerchandiseCategory(name: "MacBook Air")
//        result.append(Merchandise(name: "MacBook Air 13형 type-1",
//                                  imageName: "",
//                                  price: 1320000,
//                                  description: "1.1GHz 듀얼 코어 Core i3 프로세서"))
//
//        result.append(Merchandise(name: "MacBook Air 13형 type-2",
//                                  imageName: "",
//                                  price: 1720000,
//                                  description: "1.1GHz 쿼드 코어 Core i5 프로세서"))
//
//        return result
//    }
//
//    private static func getMerchandise_iMac21_5() -> MerchandiseCategory {
//        let result = MerchandiseCategory(name: "iMac 21.5형")
//        result.append(Merchandise(name: "iMac 21.5형 type-1",
//                                    imageName: "",
//                                    price: 1440000,
//                                    description: "2.3GHz 듀얼 코어 프로세서"))
//
//        result.append(Merchandise(name: "iMac 21.5형 type-2",
//                                    imageName: "",
//                                    price: 1690000,
//                                    description: "3.6GHz 쿼드 코어 프로세서"))
//
//        result.append(Merchandise(name: "iMac 21.5형 type-3",
//                                    imageName: "",
//                                    price: 1940000,
//                                    description: "3.0GHz 6코어 프로세서"))
//
//        return result
//    }
//
//    private static func getMerchandise_iMac27() -> MerchandiseCategory {
//        let result = MerchandiseCategory(name: "iMac 27형")
//        result.append(Merchandise(name: "iMac 27형",
//                                  imageName: "",
//                                  price: 2320000,
//                                  description: "3.0GHz 6코어 프로세서"))
//
//        result.append(Merchandise(name: "iMac 27형",
//                                  imageName: "",
//                                  price: 2570000,
//                                  description: "3.1GHz 6코어 프로세서"))
//
//        result.append(Merchandise(name: "iMac 27형",
//                                  imageName: "",
//                                  price: 2950000,
//                                  description: "3.7GHz 6코어 프로세서"))
//
//        return result
//    }
//
//    private static func getMerchandise_iMacPro() -> MerchandiseCategory {
//        let result = MerchandiseCategory(name: "iMac Pro")
//        result.append(Merchandise(name: "iMac Pro",
//                                  imageName: "",
//                                  price: 6300000,
//                                  description: "3.2GHz 8코어 Intel Xeon W 프로세서"))
//
//        return result
//    }
//
//    private static func getMerchandise_MacPro() -> MerchandiseCategory {
//        let result = MerchandiseCategory(name: "Mac Pro")
//        result.append(Merchandise(name: "Mac Pro (타워)",
//                                  imageName: "",
//                                  price: 7899000,
//                                  description: "3.5GHz 8코어 Intel Xeon W 프로세서"))
//
//        result.append(Merchandise(name: "Mac Pro (랙)",
//                                  imageName: "",
//                                  price: 8599000,
//                                  description: "3.5GHz 8코어 Intel Xeon W 프로세서"))
//
//        return result
//    }
//
//    private static func getMerchandise_MacMini() -> MerchandiseCategory {
//        let result = MerchandiseCategory(name: "Mac Mini")
//        result.append(Merchandise(name: "Mac Mini type-1",
//                                  imageName: "",
//                                  price: 1040000,
//                                  description: "3.6GHz 쿼드 코어 프로세서"))
//
//        result.append(Merchandise(name: "Mac Mini type-2",
//                                  imageName: "",
//                                  price: 1440000,
//                                  description: "3.0GHz 6코어 프로세서"))
//
//        return result
//    }
}
