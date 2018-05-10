// package com.terebinth;
//
// import com.facebook.react.ReactActivity;
//
// public class MainActivity extends ReactActivity {
//
//     /**
//      * Returns the name of the main component registered from JavaScript.
//      * This is used to schedule rendering of the component.
//      */
//     @Override
//     protected String getMainComponentName() {
//         return "terebinth";
//     }
// }


// main-activity below

package com.terebinth;

import com.facebook.react.ReactActivity;


import android.content.Intent;

import android.os.Bundle;
import com.mybigday.rns3.RNS3TransferUtility;

public class MainActivity extends ReactActivity {

    /**
     * Returns the name of the main component registered from JavaScript.
     * This is used to schedule rendering of the component.
     */
    @Override
    protected String getMainComponentName() {
        return "terebinth";
    }


    @Override
      public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        RNS3TransferUtility.nativeCredentialsOptions.put("region", "eu-west-1");
        RNS3TransferUtility.nativeCredentialsOptions.put("type", RNS3TransferUtility.CredentialType.BASIC);
        RNS3TransferUtility.nativeCredentialsOptions.put("access_key", "your_access_key_here");
        RNS3TransferUtility.nativeCredentialsOptions.put("secret_key", "your_secret_key_here");






      }





    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        MainApplication.getCallbackManager().onActivityResult(requestCode, resultCode, data);
    }
}
