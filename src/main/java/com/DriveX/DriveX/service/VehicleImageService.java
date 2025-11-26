package com.DriveX.DriveX.service;

import com.DriveX.DriveX.model.vehicle.Vehicle;
import com.DriveX.DriveX.model.vehicle.VehicleImage;
import com.DriveX.DriveX.repository.VehicleImageRepository;
import com.DriveX.DriveX.repository.VehicleRepository;
import org.springframework.stereotype.Service;

@Service
public class VehicleImageService {

    private final VehicleImageRepository imageRepo;
    private final VehicleRepository vehicleRepo;

    public VehicleImageService(VehicleImageRepository imageRepo, VehicleRepository vehicleRepo) {
        this.imageRepo = imageRepo;
        this.vehicleRepo = vehicleRepo;
    }

    public VehicleImage addImage(Long vehicleId, String imageUrl, boolean isMain) {

        long count = imageRepo.countByVehicle_Id(vehicleId);
        if (count >= 15) {
            throw new IllegalStateException("Este vehículo ya tiene el máximo de 15 imágenes");
        }

        Vehicle vehicle = vehicleRepo.findById(vehicleId)
                .orElseThrow(() -> new RuntimeException("Vehicle not found"));

        VehicleImage img = new VehicleImage();
        img.setVehicle(vehicle);
        img.setImageUrl(imageUrl);
        img.setMain(isMain);

        return imageRepo.save(img);
    }

    public java.util.List<VehicleImage> getImages(Long vehicleId) {
        return imageRepo.findByVehicle_Id(vehicleId);
    }
}