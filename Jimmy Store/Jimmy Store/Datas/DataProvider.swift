import Foundation

final class DataProvider {
    internal static func getMerchandises() -> [MerchandiseCategory] {
        var items = [MerchandiseCategory]()
        
        let cateMacBookPro13 = DataProvider.getMerchandise_MacBookPro13()
        let cateMacBookPro16 = DataProvider.getMerchandise_MacBookPro16()
        let cateMacBookAir = DataProvider.getMerchandise_MacBookAir()
        let cateiMac21_5 = DataProvider.getMerchandise_iMac21_5()
        let cateiMac27 = DataProvider.getMerchandise_iMac27()
        let cateiMacPro = DataProvider.getMerchandise_iMacPro()
        let cateMacPro = DataProvider.getMerchandise_MacPro()
        let cateMacMini = DataProvider.getMerchandise_MacMini()
        
        items.append(cateMacBookPro13)
        items.append(cateMacBookPro16)
        items.append(cateMacBookAir)
        items.append(cateiMac21_5)
        items.append(cateiMac27)
        items.append(cateiMacPro)
        items.append(cateMacPro)
        items.append(cateMacMini)
        
        return items
    }
    
    
    private static func getMerchandise_MacBookPro13() -> MerchandiseCategory {
        let result = MerchandiseCategory(name: "MacBook Pro 13형")
        result.append(Merchandise(name: "MacBook Pro 13형 type-1",
                                  imageName: "",
                                  price: 1720000,
                                  description: "1.4GHz 쿼드 코어 프로세서"))
        
        result.append(Merchandise(name: "MacBook Pro 13형 type-2",
                                  imageName: "",
                                  price: 1990000,
                                  description: "1.4GHz 쿼드 코어 프로세서"))
        
        result.append(Merchandise(name: "MacBook Pro 13형 type-3",
                                  imageName: "",
                                  price: 2490000,
                                  description: "2.0GHz 쿼드 코어 프로세서"))
        
        return result
    }
    
    private static func getMerchandise_MacBookPro16() -> MerchandiseCategory {
        let result = MerchandiseCategory(name: "MacBook Pro 16형")
        result.append(Merchandise(name: "MacBook Pro 16형 type-1",
                                  imageName: "",
                                  price: 3190000,
                                  description: "2.6GHz 6코어 프로세서"))
        
        result.append(Merchandise(name: "MacBook Pro 16형 type-1",
                                  imageName: "",
                                  price: 3690000,
                                  description: "2.3GHz 8코어 프로세서"))
        
        return result
    }
    
    private static func getMerchandise_MacBookAir() -> MerchandiseCategory {
        let result = MerchandiseCategory(name: "MacBook Air")
        result.append(Merchandise(name: "MacBook Air 13형 type-1",
                                  imageName: "",
                                  price: 1320000,
                                  description: "1.1GHz 듀얼 코어 Core i3 프로세서"))
        
        result.append(Merchandise(name: "MacBook Air 13형 type-2",
                                  imageName: "",
                                  price: 1720000,
                                  description: "1.1GHz 쿼드 코어 Core i5 프로세서"))
        
        return result
    }
    
    private static func getMerchandise_iMac21_5() -> MerchandiseCategory {
        let result = MerchandiseCategory(name: "iMac 21.5형")
        result.append(Merchandise(name: "iMac 21.5형 type-1",
                                    imageName: "",
                                    price: 1440000,
                                    description: "2.3GHz 듀얼 코어 프로세서"))
        
        result.append(Merchandise(name: "iMac 21.5형 type-2",
                                    imageName: "",
                                    price: 1690000,
                                    description: "3.6GHz 쿼드 코어 프로세서"))
        
        result.append(Merchandise(name: "iMac 21.5형 type-3",
                                    imageName: "",
                                    price: 1940000,
                                    description: "3.0GHz 6코어 프로세서"))
        
        return result
    }
    
    private static func getMerchandise_iMac27() -> MerchandiseCategory {
        let result = MerchandiseCategory(name: "iMac 27형")
        result.append(Merchandise(name: "iMac 27형",
                                  imageName: "",
                                  price: 2320000,
                                  description: "3.0GHz 6코어 프로세서"))
        
        result.append(Merchandise(name: "iMac 27형",
                                  imageName: "",
                                  price: 2570000,
                                  description: "3.1GHz 6코어 프로세서"))
        
        result.append(Merchandise(name: "iMac 27형",
                                  imageName: "",
                                  price: 2950000,
                                  description: "3.7GHz 6코어 프로세서"))
        
        return result
    }
    
    private static func getMerchandise_iMacPro() -> MerchandiseCategory {
        let result = MerchandiseCategory(name: "iMac Pro")
        result.append(Merchandise(name: "iMac Pro",
                                  imageName: "",
                                  price: 6300000,
                                  description: "3.2GHz 8코어 Intel Xeon W 프로세서"))
        
        return result
    }
    
    private static func getMerchandise_MacPro() -> MerchandiseCategory {
        let result = MerchandiseCategory(name: "Mac Pro")
        result.append(Merchandise(name: "Mac Pro (타워)",
                                  imageName: "",
                                  price: 7899000,
                                  description: "3.5GHz 8코어 Intel Xeon W 프로세서"))
        
        result.append(Merchandise(name: "Mac Pro (랙)",
                                  imageName: "",
                                  price: 8599000,
                                  description: "3.5GHz 8코어 Intel Xeon W 프로세서"))
        
        return result
    }
    
    private static func getMerchandise_MacMini() -> MerchandiseCategory {
        let result = MerchandiseCategory(name: "Mac Mini")
        result.append(Merchandise(name: "Mac Mini type-1",
                                  imageName: "",
                                  price: 1040000,
                                  description: "3.6GHz 쿼드 코어 프로세서"))
        
        result.append(Merchandise(name: "Mac Mini type-2",
                                  imageName: "",
                                  price: 1440000,
                                  description: "3.0GHz 6코어 프로세서"))
        
        return result
    }
}