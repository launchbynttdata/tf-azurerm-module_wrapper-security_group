package common

import (
	"context"
	"os"
	"testing"

	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v5"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
)

func TestComposableComplete(t *testing.T, ctx types.TestContext) {

	subscriptionID := os.Getenv("ARM_SUBSCRIPTION_ID")
	if len(subscriptionID) == 0 {
		t.Fatal("ARM_SUBSCRIPTION_ID is not set in the environment variables ")
	}

	cred, err := azidentity.NewDefaultAzureCredential(nil)

	if err != nil {
		t.Fatalf("Unable to get credentials: %e\n", err)
	}

	clientFactory, err := armnetwork.NewClientFactory(subscriptionID, cred, nil)
	if err != nil {
		t.Fatalf("Unable to get clientFactory: %e\n", err)
	}

	securityGroupClient := clientFactory.NewSecurityGroupsClient()

	expectedSecurityGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "network_security_group_name")
	expectedResourceGroupName := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_name")

	t.Run("SecurityGroupExists", func(t *testing.T) {
		actualSecurityGroup, err := securityGroupClient.Get(context.Background(), expectedResourceGroupName, expectedSecurityGroupName, nil)
		if err != nil {
			t.Fatalf("Error getting Security Group: %v", err)
		}
		assert.Equal(t, expectedSecurityGroupName, *actualSecurityGroup.Name, "Security Group name didn't match expected.")
	})
}
