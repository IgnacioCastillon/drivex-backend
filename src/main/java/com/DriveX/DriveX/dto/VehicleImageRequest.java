package com.DriveX.DriveX.dto;

public class VehicleImageRequest {

    private String imageUrl;
    private boolean isMain;

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public boolean isMain() {
        return isMain;
    }

    public void setMain(boolean main) {
        isMain = main;
    }
}