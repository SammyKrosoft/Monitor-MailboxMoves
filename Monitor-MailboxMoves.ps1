#The below launches the Move Mailbox monitoring:
While ($true) {
    $Date=Get-Date
    $MoveRequest = Get-MoveRequest | Get-MoveRequestStatistics
    Cls
    $Date
    $MoveRequest | ft DisplayName,StatusDetail, TotalMailboxSize,PercentComplete
    sleep 1
}

# End of the script.
