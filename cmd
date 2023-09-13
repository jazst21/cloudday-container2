copilot init --app cloudday2 --dockerfile svc-api-markdown/Dockerfile --name svc-api-markdown2 --type  "Load Balanced Web Service"
copilot env init --name staging2 --default-config --profile default
copilot env deploy --name staging2
copilot storage init -t DynamoDB -n markdown-table2 --partition-key ID:S --no-lsi --no-sort -w svc-api-markdown2
copilot svc deploy --name svc-api-markdown2 --env staging2
copilot svc show --name svc-api-markdown2
-----
#copilot pipeline init --name module2 --url https://github.com/jazst21/cloudday-container.git --git-branch main --environments staging,production --pipeline-type Workloads
copilot pipeline init --name cloudday2 --url https://github.com/jazst21/cloudday-container2.git --git-branch main --environments staging2 --pipeline-type Workloads
git add copilot/
git commit -m "Add copilot files"
git push -u origin2 main
copilot pipeline deploy
cat "Hello pipeline!" > test-pipeline
copilot pipeline status
-----
copilot pipeline delete --delete-secret --name cloudday2
copilot svc delete svc-api-markdown2
copilot env delete production2
copilot env delete staging2
copilot app delete module2
copilot app delete cloudday2
----
echo "# cloudday-container2" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin2 https://github.com/jazst21/cloudday-container2.git
git push -u origin2 main