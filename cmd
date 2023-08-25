copilot init --app module2 --dockerfile svc-api-markdown/Dockerfile --name svc-api-markdown --type  "Load Balanced Web Service"
copilot env init --name staging --default-config --profile default
copilot env deploy --name staging
copilot storage init -t DynamoDB -n markdown-table --partition-key ID:S --no-lsi --no-sort -w svc-api-markdown
copilot svc deploy --name svc-api-markdown --env staging
copilot svc show --name svc-api-markdown
-----
#copilot pipeline init --name module2 --url https://github.com/jazst21/cloudday-container.git --git-branch main --environments staging,production --pipeline-type Workloads
copilot pipeline init --name module2 --url https://github.com/jazst21/cloudday-container.git --git-branch main --environments staging --pipeline-type Workloads
git add copilot/
git commit -m "Add copilot files"
git push -u origin main
copilot pipeline deploy
cat "Hello pipeline!" > test-pipeline
copilot pipeline status
-----
copilot pipeline delete --delete-secret --name module1
copilot app delete
copilot env delete production
copilot env delete staging