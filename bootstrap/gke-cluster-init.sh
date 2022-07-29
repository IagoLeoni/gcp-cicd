# Creates 3 GKE autopilot clusters
# ACTION REQUIRED! Change "project-id-here" value to the project you'll be using
export PROJECT_ID="gke-demo-cicd"
# Test cluster
echo "creating devcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "devcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
# Staging cluster
echo "creating qacluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "qacluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
# Prod cluster
echo "creating prodcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "prodcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/default" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/default" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --async 
echo "Creating clusters! Check the UI for progress"
