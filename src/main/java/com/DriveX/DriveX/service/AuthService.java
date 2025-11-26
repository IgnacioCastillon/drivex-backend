package com.DriveX.DriveX.service;

import com.DriveX.DriveX.model.user.User;
import com.DriveX.DriveX.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private final UserRepository repo;

    public AuthService(UserRepository repo) {
        this.repo = repo;
    }

    public User login(String email, String password) {

        User user = repo.findByEmail(email)
                .orElse(null);

        if (user == null) return null;

        if (!user.getPassword_hash().equals(password)) return null;

        return user;
    }
}