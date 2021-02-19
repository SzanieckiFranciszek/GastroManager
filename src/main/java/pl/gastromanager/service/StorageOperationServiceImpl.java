package pl.gastromanager.service;

import org.springframework.stereotype.Service;
import pl.gastromanager.model.Ingredient;
import pl.gastromanager.model.StorageOperation;
import pl.gastromanager.repository.StorageOperationRepository;
import java.util.List;
import java.util.Optional;

@Service
public class StorageOperationServiceImpl implements StorageOperationService {

    private final StorageOperationRepository storageOperationRepository;
    private final IngredientService ingredientService;

    public StorageOperationServiceImpl(StorageOperationRepository storageOperationRepository, IngredientService ingredientService) {
        this.storageOperationRepository = storageOperationRepository;
        this.ingredientService = ingredientService;
    }

    @Override
    public Optional<StorageOperation> findById(Long id) {
        return storageOperationRepository.findById(id);
    }

    @Override
    public void saveStorageOperation(StorageOperation storageOperation) {
        storageOperationRepository.save(storageOperation);
    }

    @Override
    public void addStorageOperation(StorageOperation storageOperation) {
        storageOperationRepository.save(storageOperation);
    }

    @Override
    public void deleteStorageOperation(Long id) {
        storageOperationRepository.deleteById(id);
    }

    @Override
    public List<StorageOperation> findAll() {
        return storageOperationRepository.findAll();
    }

    @Override
    public List<StorageOperation> findAllByStorageOperationItemId(Long id) {
        return storageOperationRepository.findAllByStorageOperationItemId(id);
    }

    @Override
    public void updateTotalQuantityIngredient(Long id) {
        float quantity=storageOperationRepository.getTotalQuantityIngredient(id);
        Ingredient ingredient=ingredientService.findById(id).get();
        ingredient.setCurrentQuantity(quantity);
        ingredientService.saveIngredient(ingredient);
    }
}
