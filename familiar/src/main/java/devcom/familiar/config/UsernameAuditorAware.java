package devcom.familiar.config;

import java.util.Optional;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingClass;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@ConditionalOnMissingClass("org.springframework.cloud.dataflow.server.service.SpringSecurityAuditorAware")
@Component("usernameAuditorAware")
public class UsernameAuditorAware implements AuditorAware<String> {	
    @Override
    public Optional<String> getCurrentAuditor() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return null;
        }
        return Optional.of(authentication.getName());
    }
}
