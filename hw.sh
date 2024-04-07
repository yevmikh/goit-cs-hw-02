websites=("https://google.com" "https://facebook.com" "https://twitter.com" "https://linkedin.com" "http://downWebsite.com")

log="check.log"

>"$log"

for website in "${websites[@]}"
    do

        if curl -o /dev/null -s -L --head --request GET -w  "%{http_code}\n" "$website" | grep 200 > /dev/null
        then 
            echo "$website is UP" >> "$log"
        else 
            echo "$website is DOWN" >> "$log"
        fi

    done 

    echo "Results written to $log"         



