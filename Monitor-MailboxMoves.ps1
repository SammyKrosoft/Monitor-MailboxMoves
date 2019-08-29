#Beginning of the script:
Cls

#Populate a variable with the mailboxes you want to move:
$E2016MailboxesAll = Get-ExchangeServer | ? {$_.AdminDisplayVersion -like "*15.1*"} | get-mailbox -Filter {DisplayName -like "*Alex*"}

#Use that variable to initiate a move request:
$E2016MailboxesAll | New-MoveRequest –TargetDatabase ESDC-DAG-DB0002

#The below launches the Move Mailbox monitoring:
While ($true) {
    $Date=Get-Date
    $MoveRequest = $E2016MailboxesAll | Get-MoveRequest | Get-MoveRequestStatistics
    Cls
    $Date
    $MoveRequest | ft DisplayName,StatusDEtail, TotalMailboxSize,PercentComplete
    sleep 1
}

# End of the script.
