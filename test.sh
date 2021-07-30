base_path="http://localhost:8080"

mkdir reports

ab -l -n 10000 -c 1000 "${base_path}/questions?limit=20" > "reports/questions_limit20.txt"
ab -l -n 10000 -c 1000 "${base_path}/answers?limit=10" > "reports/answers_limit10.txt"
