base_path="http://localhost:8081"

mkdir reports

ab -l -n 10000 -c 2000 "${base_path}/questions?limit=8" > "reports/questions_limit8.txt"
ab -l -n 10000 -c 2000 "${base_path}/answers?limit=8" > "reports/answers_limit8.txt"