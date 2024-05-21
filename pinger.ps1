# Load the CSV file
$hostnames = Import-Csv -Path "C:\temp\hosts.csv"

foreach ($hostname in $hostnames) {
    $hostname = $hostname.Hostname
    Write-Output "Pinging $hostname..."
    
    # Ping the host
    $pingResult = Test-Connection -ComputerName $hostname -Count 4 -ErrorAction SilentlyContinue
    
    # Check if the ping was successful
    if ($pingResult) {
        Write-Output "$hostname is reachable."
    } else {
        Write-Output "$hostname is not reachable."
    }
    
    Write-Output ""
}
