package com.example.image_filter_app;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

import androidx.annotation.NonNull;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL ="image.editing_app/dev";


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);


        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),CHANNEL).setMethodCallHandler((call, result) -> {
            if (call.method.equals("getModifiedImage")){
                System.out.print("===================================Image path from Dart class ======");

                String image = call.argument("image");
                System.out.print("============Image path from Dart class ======="+image);
                if (image != null){
                    //   imageFile= new File(image);
                    System.out.print("============Image path from Dart class ======="+image);
                    try {
                        InputStream inputStream = new FileInputStream(image);
                        //  InputStream inputStream1 = assetManager.open(LR_IMG_1);
                        Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
                        Log.d("hhh", " Bit map Imag ------- "+bitmap);
                        if (bitmap != null){

                           //  result.success(image);
                        }
                    }
                    catch (IOException e){
                        Log.e("hhh", "Failed to open an low resolution image");


                    }


                }
                Log.d("tag", "configureFlutterEngine: how are you "+image);
                result.success("data send successfully-==-=-=-==-=-=-"+image);
            }

            else{
                result.notImplemented();
            }
        });













    }
}
