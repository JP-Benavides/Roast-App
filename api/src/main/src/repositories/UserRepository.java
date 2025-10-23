package roast.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import roast.models.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    //Add interface for changing user information

    Optional<User> findByEmail(String email);
}
