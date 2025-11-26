package com.DriveX.DriveX.repository;

import com.DriveX.DriveX.model.vehicle.VehicleImage;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface VehicleImageRepository extends JpaRepository<VehicleImage, Long> {

    long countByVehicle_Id(Long vehicleId);

    List<VehicleImage> findByVehicle_Id(Long vehicleId);

}