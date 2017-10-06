function Get-SecurityGroup {
    
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$true,Position=0)]
        [String]$SMRAAccount

    )


    $SMRA = (Get-ADUser -Filter {name -like $SMRAAccount} -Properties displayname | select displayname).displayname
    $searchableSMRA = "*$SMRA*"

    $securityGroup = (Get-ADGroup -Filter {Description -like $searchableSMRA}).name

    $securityGroup

}