function posErrors = calcPosErrors(pos,posError)
posErrors(:,1) = pos(:,1) + posError.*(randn(size(pos,1),1));
posErrors(:,2) = pos(:,2) + posError.*(randn(size(pos,1),1));
posErrors(:,3) = pos(:,3) + posError.*(randn(size(pos,1),1));
end