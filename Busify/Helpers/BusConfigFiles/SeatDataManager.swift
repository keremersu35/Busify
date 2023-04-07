
import Foundation
import ALBusSeatView

class SeatDataManager {
    var seatList = [[SeatStub]]()
    var selectedSeatlist = [SeatStub]()
}


extension SeatDataManager: ALBusSeatViewDelegate {
    
    func seatView(_ seatView: ALBusSeatView,
                  didSelectAtIndex indexPath: IndexPath,
                  seatType: ALBusSeatType, selectionType: ALSelectionType) {
        
        if let cell = seatView.superview?.superview as? TicketCell {
            cell.seatSelected(at: indexPath, selectionType: selectionType)
        }
    }
    
    func seatView(_ seatView: ALBusSeatView,
                  deSelectAtIndex indexPath: IndexPath,
                  seatType: ALBusSeatType) {
        
        if let cell = seatView.superview?.superview as? TicketCell {
            cell.seatDeselected(at: indexPath)
        }
    }
}

extension SeatDataManager:  ALBusSeatViewDataSource  {
    
    func seatView(_ seatView: ALBusSeatView,
                  seatNumberForIndex indexPath: IndexPath) -> String {
        
        let stub = seatList[indexPath.section][indexPath.item]
        return "\(stub.number)"
    }
    
    func seatView(_ seatView: ALBusSeatView,
                  seatTypeForIndex indexPath: IndexPath) -> ALBusSeatType {
        
        let stub = seatList[indexPath.section][indexPath.item]
        
        if stub.hall { // Hall area
            return .none
        } else if selectedSeatlist.contains(where: { $0.id == stub.id }) { // Selected
            return .selected
        } else if stub.salable { // Open for sale
            return .empty
        } else if stub.gender == true { // Full by man
            return .soldMan
        } else if stub.gender == false { // Full by woman
            return .soldWoman
        } else { // Else not a seat
            return .none
        }
    }
    
    func numberOfSections(in seatView: ALBusSeatView) -> Int {
        return seatList.count
    }
    
    func seatView(_ seatView: ALBusSeatView,
                  numberOfSeatInSection section: Int) -> Int {
        
        return seatList[section].count
    }
}
