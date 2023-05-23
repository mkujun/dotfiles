# function for renaming current windows terminal tab
function title {
    param(
        [string]
        $title
    )
    $Host.UI.RawUI.WindowTitle = $title   
}
