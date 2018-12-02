---@class shCamera
local shCamera = {}

---@param NSpeed number
---@return void
function shCamera:setOrientSpeed(NSpeed) end


---@return number
function shCamera:getOrientSpeed() end

---@param NSpeed number
---@return void
function shCamera:setMoveSpeed(NSpeed) end


---@return number
function shCamera:getMoveSpeed() end

---@param NStrafeSpeed number
---@return void
function shCamera:setStrafeSpeed(NStrafeSpeed) end


---@return number
function shCamera:getStrafeSpeed() end

---@param NLiftSpeed number
---@return void
function shCamera:setLiftSpeed(NLiftSpeed) end


---@return number
function shCamera:getLiftSpeed() end

---@param NSpeed number
---@return void
function shCamera:setHRotSpeed(NSpeed) end


---@return number
function shCamera:getHRotSpeed() end

---@param NSpeed number
---@return void
function shCamera:setVRotSpeed(NSpeed) end


---@return number
function shCamera:getVRotSpeed() end

---@param Param number
---@return void
function shCamera:setFovScr(Param) end


---@return number
function shCamera:getFovScr() end

---@param TargetId number
---@param VertShift number
---@return void
function shCamera:setLookTarget(TargetId, VertShift) end

---@param TargetId number
---@param VertShift number
---@param Distance number
---@param Angle number
---@param Soft boolean
---@return void
function shCamera:setLookFocus(TargetId, VertShift, Distance, Angle, Soft) end

---@param animationName string
---@return void
function shCamera:execAnim(animationName) end


---@return void
function shCamera:stopAnim() end


---@class shCharacter
local shCharacter = {}

---@param params COnHitParams
---@return void
function shCharacter:OnHit(params) end

---@param HorAngle number
---@return void
function shCharacter:setOrientation(HorAngle) end


---@return number
function shCharacter:getOrientation() end

---@param HorAngle number
---@return void
function shCharacter:setOrientationFull(HorAngle) end


---@return number
function shCharacter:getOrientationFull() end

---@param horAngleDiff number
---@return void
function shCharacter:setOrientationDifference(horAngleDiff) end

---@param state boolean
---@return void
function shCharacter:setVisible(state) end


---@return boolean
function shCharacter:getVisible() end


---@return boolean
function shCharacter:getSleep() end

---@param state boolean
---@return void
function shCharacter:setIgnoreSleep(state) end


---@return boolean
function shCharacter:getIgnoreSleep() end


---@return string
function shCharacter:getPrefabName() end


---@return vec3
function shCharacter:getDirTarget() end


---@return vec3
function shCharacter:getDir() end

---@param eventName string
---@return void
function shCharacter:callAnimEvent(eventName) end

---@param enable boolean
---@return void
function shCharacter:setCollision(enable) end


---@return boolean
function shCharacter:getCollision() end

---@param width number
---@param height number
---@param length number
---@return void
function shCharacter:setSensorScale(width, height, length) end

---@param vertShift number
---@return void
function shCharacter:setSensorLift(vertShift) end

---@param angle number
---@return void
function shCharacter:setSensorAngle(angle) end

---@param enable boolean
---@return void
function shCharacter:setFeelVisible(enable) end


---@return boolean
function shCharacter:getFeelVisible() end

---@param Radius number
---@return void
function shCharacter:setFeelRadius(Radius) end


---@return number
function shCharacter:getFeelRadius() end

---@param NewFlowSpeed number
---@return void
function shCharacter:setFlowSpeed(NewFlowSpeed) end


---@return number
function shCharacter:getFlowSpeed() end

---@param speed number
---@return void
function shCharacter:setMoveSpeed(speed) end


---@return number
function shCharacter:getMoveSpeed() end

---@param speed number
---@return void
function shCharacter:setStrafeSpeed(speed) end


---@return number
function shCharacter:getStrafeSpeed() end

---@param position vec3
---@param direction vec3
---@param time number
---@return void
function shCharacter:moveAndOrientate(position, direction, time) end


---@return void
function shCharacter:stopMoveAndOrientate() end

---@param dir vec3
---@param force number
---@param time number
---@return void
function shCharacter:push(dir, force, time) end

---@param _velocity number
---@return void
function shCharacter:startJump(_velocity) end


---@return boolean
function shCharacter:isInAir() end

---@param RSpeed number
---@return void
function shCharacter:setOrientationSpeed(RSpeed) end


---@return number
function shCharacter:getOrientationSpeed() end

---@param RSpeed number
---@return void
function shCharacter:setRotationSpeed(RSpeed) end


---@return number
function shCharacter:getRotationSpeed() end


---@return string
function shCharacter:getName() end


---@return string
function shCharacter:getScriptClass() end

---@param _value number
---@return void
function shCharacter:setHealth(_value) end


---@return number
function shCharacter:getHealth() end

---@param Value number
---@return void
function shCharacter:setMassCoeff(Value) end


---@return number
function shCharacter:getMassCoeff() end

---@param animName string
---@param delayIn number
---@param delayOut number
---@param weight number
---@param autoLock boolean
---@return boolean
function shCharacter:playAction(animName, delayIn, delayOut, weight, autoLock) end

---@param animName string
---@return boolean
function shCharacter:stopAction(animName) end


---@return string
function shCharacter:getActiveAction() end

---@param animName string
---@return number
function shCharacter:getActionTime(animName) end

---@param animName string
---@return number
function shCharacter:getCycleTime(animName) end

---@param animName string
---@param time number
---@return void
function shCharacter:setActionTime(animName, time) end


---@return void
function shCharacter:stopActions() end

---@param animName string
---@param delay number
---@param weight number
---@return boolean
function shCharacter:playCycle(animName, delay, weight) end

---@param animName string
---@param delay number
---@return boolean
function shCharacter:stopCycle(animName, delay) end

---@param delay number
---@return void
function shCharacter:stopCycles(delay) end

---@param AName string
---@param autoLock boolean
---@return void
function shCharacter:execAnimSingle(AName, autoLock) end

---@param AName string
---@param delay number
---@return void
function shCharacter:execAnimState(AName, delay) end

---@param AName string
---@return void
function shCharacter:stopAnimSingle(AName) end

---@param AName string
---@return void
function shCharacter:stopAnimState(AName) end


---@return void
function shCharacter:stopAnimStates() end

---@param fileName string
---@return number
function shCharacter:getAnimDuration(fileName) end

---@param animName string
---@param eventName string
---@param startFrame number
---@param endFrame number
---@return boolean
function shCharacter:addAnimationEvent(animName, eventName, startFrame, endFrame) end

---@param animName string
---@param eventName string
---@return boolean
function shCharacter:removeAnimationEvent(animName, eventName) end

---@param animName string
---@param eventName string
---@return number, number
function shCharacter:getAnimationEventInterval(animName, eventName) end

---@param SoundName string
---@return void
function shCharacter:playSound(SoundName) end

---@param SoundName string
---@return void
function shCharacter:stopSound(SoundName) end


---@return void
function shCharacter:stopSounds() end

---@param SoundName string
---@param Enable boolean
---@return void
function shCharacter:soundLoop(SoundName, Enable) end

---@param SoundName string
---@param Time number
---@return void
function shCharacter:soundRepeat(SoundName, Time) end

---@param SoundName string
---@param Value number
---@return void
function shCharacter:soundDistance(SoundName, Value) end

---@param SoundName string
---@param Value number
---@return void
function shCharacter:soundVolume(SoundName, Value) end

---@param SoundName string
---@param Value number
---@return void
function shCharacter:soundSpeed(SoundName, Value) end

---@param targetPos vec3
---@param currentDirMode boolean
---@return number
function shCharacter:getTargetAngle(targetPos, currentDirMode) end


---@return number
function shCharacter:getCollisionRadius() end


---@return number
function shCharacter:getCollisionHeight() end

---@param state boolean
---@return void
function shCharacter:setActive(state) end


---@return boolean
function shCharacter:getActive() end

---@param object shTransformActor
---@return void
function shCharacter:setPose(object) end


---@return shTransformActor
function shCharacter:getPose() end

---@param boneName string
---@return shTransformActor
function shCharacter:getBonePose(boneName) end

---@param bonePartName string
---@return shTransformActor
function shCharacter:findBonePose(bonePartName) end

---@param aspectPrefab string
---@return shEmitter | Sound | shLightOmni | shInteractor | shRigidMeshActor
function shCharacter:createAspect(aspectPrefab) end

---@param object shEmitter | Sound | shLightOmni | shInteractor | shRigidMeshActor
---@return void
function shCharacter:destroyAspect(object) end

---@param Target shTransformActor
---@param offset any
---@param Angle number
---@return void
function shCharacter:setLookTarget(Target, offset, Angle) end


---@return void
function shCharacter:resetLookTarget() end

---@param channel number
---@param texture string
---@return void
function shCharacter:setTexture(channel, texture) end

---@param meshName string
---@param channel number
---@param texture string
---@return void
function shCharacter:setMeshTexture(meshName, channel, texture) end


---@class shEmitter
local shEmitter = {}

---@param enable boolean
---@return void
function shEmitter:run(enable) end


---@return void
function shEmitter:play() end


---@return void
function shEmitter:stop() end


---@return void
function shEmitter:enable() end


---@return void
function shEmitter:disable() end

---@param enable boolean
---@return void
function shEmitter:setLoop(enable) end


---@return boolean
function shEmitter:getLoop() end


---@return boolean
function shEmitter:isActive() end

---@param state boolean
---@return void
function shEmitter:setVisible(state) end


---@return boolean
function shEmitter:getVisible() end

---@param object shTransformActor
---@return void
function shEmitter:setPose(object) end


---@return shTransformActor
function shEmitter:getPose() end


---@class shEnvirNode
local shEnvirNode = {}

---@param val any
---@return void
function shEnvirNode:setAmbient(val) end


---@return any
function shEnvirNode:getAmbient() end

---@param val any
---@return void
function shEnvirNode:setAmbientLow(val) end


---@return any
function shEnvirNode:getAmbientLow() end

---@param val any
---@return void
function shEnvirNode:setAmbientHigh(val) end


---@return any
function shEnvirNode:getAmbientHigh() end

---@param val any
---@return void
function shEnvirNode:setDiffuse(val) end


---@return any
function shEnvirNode:getDiffuse() end

---@param val any
---@return void
function shEnvirNode:setFogColor(val) end


---@return any
function shEnvirNode:getFogColor() end

---@param val number
---@return void
function shEnvirNode:setFogNear(val) end


---@return number
function shEnvirNode:getFogNear() end

---@param val number
---@return void
function shEnvirNode:setFogFar(val) end


---@return number
function shEnvirNode:getFogFar() end

---@param val number
---@return void
function shEnvirNode:setFogDensity(val) end


---@return number
function shEnvirNode:getFogDensity() end

---@param val vec3
---@return void
function shEnvirNode:setLightPos(val) end

---@param val number
---@return void
function shEnvirNode:setLightIntensity(val) end


---@return number
function shEnvirNode:getLightIntensity() end

---@param val number
---@return void
function shEnvirNode:setBloomIntensity(val) end

---@param val any
---@return void
function shEnvirNode:setShaftsColor(val) end

---@param val number
---@return void
function shEnvirNode:setShaftsIntensity(val) end

---@param val number
---@return void
function shEnvirNode:setShaftsAttenuation(val) end

---@param val number
---@return void
function shEnvirNode:setShaftsLength(val) end


---@class shGun : shItem
local shGun = {}

---@param value number
---@return void
function shGun:setAccuracy(value) end


---@return number
function shGun:getAccuracy() end

---@param value number
---@return void
function shGun:setBulletsInShot(value) end


---@return number
function shGun:getBulletsInShot() end

---@param value number
---@return void
function shGun:setBulletsSpeed(value) end


---@return number
function shGun:getBulletsSpeed() end

---@param value boolean
---@return void
function shGun:setGrenadeMode(value) end


---@return boolean
function shGun:getGrenadeMode() end

---@param size number
---@param mass number
---@param timer number
---@param explosionForce number
---@param explosionRadius number
---@param explodeOnTouch boolean
---@return void
function shGun:setGrenadeParams(size, mass, timer, explosionForce, explosionRadius, explodeOnTouch) end

---@param val number
---@return void
function shGun:setLightRadius(val) end


---@return number
function shGun:getLightRadius() end

---@param val number
---@return void
function shGun:setLightIntensity(val) end


---@return number
function shGun:getLightIntensity() end

---@param val any
---@return void
function shGun:setLightColor(val) end


---@return any
function shGun:getLightColor() end

---@param val number
---@return void
function shGun:setLightBlinkFrequency(val) end


---@return number
function shGun:getLightBlinkFrequency() end

---@param val number
---@return void
function shGun:setLightBlinkIntensity(val) end


---@return number
function shGun:getLightBlinkIntensity() end


---@class shInteractor
local shInteractor = {}

---@param state boolean
---@return void
function shInteractor:setTriggerActive(state) end


---@return boolean
function shInteractor:getTriggerActive() end

---@param val number
---@return void
function shInteractor:setTriggerRadius(val) end


---@return number
function shInteractor:getTriggerRadius() end

---@param val boolean
---@return void
function shInteractor:setRaycastActive(val) end


---@return boolean
function shInteractor:getRaycastActive() end

---@param val number
---@return void
function shInteractor:setRaycastRadius(val) end


---@return number
function shInteractor:getRaycastRadius() end

---@param object shTransformActor
---@return void
function shInteractor:setRaycastTarget(object) end


---@return shTransformActor
function shInteractor:getRaycastTarget() end

---@param obj any
---@return void
function shInteractor:setObject(obj) end


---@return any
function shInteractor:getObject() end

---@param object shTransformActor
---@return void
function shInteractor:setPose(object) end


---@return shTransformActor
function shInteractor:getPose() end


---@class shItem
local shItem = {}

---@param params COnHitParams
---@return void
function shItem:OnHitTarget(params) end

---@param state boolean
---@return void
function shItem:setPlayerMode(state) end


---@return boolean
function shItem:getPlayerMode() end

---@param dir any
---@return void
function shItem:setImpactPos(dir) end


---@return any
function shItem:getImpactPos() end

---@param effectsNames any
---@return void
function shItem:setImpactEffects(effectsNames) end


---@return any
function shItem:getImpactEffects() end

---@param enableCharCollide boolean
---@param enableCharPush boolean
---@return void
function shItem:setCollisionCharactersRoot(enableCharCollide, enableCharPush) end

---@param enable boolean
---@return void
function shItem:setDynamicRoot(enable) end


---@return boolean
function shItem:getDynamicRoot() end


---@return void
function shItem:runAction() end


---@return void
function shItem:stopAction() end

---@param object any
---@return void
function shItem:setObject(object) end


---@return any
function shItem:getObject() end

---@param mesh shMesh
---@return void
function shItem:setActionMesh(mesh) end

---@param mesh shMesh
---@return void
function shItem:setTraceMesh(mesh) end

---@param effectsNames any
---@return void
function shItem:setTraceEffects(effectsNames) end


---@return any
function shItem:getTraceEffects() end

---@param groups string
---@return void
function shItem:setGameGroups(groups) end

---@param aspectPrefab string
---@return shEmitter | Sound | shLightOmni | shInteractor | shRigidMeshActor
function shItem:createAspect(aspectPrefab) end

---@param object shEmitter | Sound | shLightOmni | shInteractor | shRigidMeshActor
---@return void
function shItem:destroyAspect(object) end


---@class shLightOmni
local shLightOmni = {}

---@param radius number
---@return void
function shLightOmni:setRadius(radius) end


---@return number
function shLightOmni:getRadius() end

---@param value number
---@return void
function shLightOmni:setIntensity(value) end


---@return number
function shLightOmni:getIntensity() end

---@param state boolean
---@return void
function shLightOmni:setVisible(state) end


---@return boolean
function shLightOmni:getVisible() end

---@param value any
---@return void
function shLightOmni:setColor(value) end


---@return any
function shLightOmni:getColor() end

---@param object shTransformActor
---@return void
function shLightOmni:setPose(object) end


---@return shTransformActor
function shLightOmni:getPose() end


---@class shPlayer : shCharacter
local shPlayer = {}

---@param fileName string
---@return void
function shPlayer:setCameraAnimFile(fileName) end


---@return string
function shPlayer:getCameraAnimFile() end

---@param animName string
---@param cameraIdIn number
---@param cameraIdOut number
---@param timeIn number
---@param timeOut number
---@param loop boolean
---@param relative boolean
---@return void
function shPlayer:execCameraAnim(animName, cameraIdIn, cameraIdOut, timeIn, timeOut, loop, relative) end

---@param height number
---@param time number
---@return void
function shPlayer:setCameraHeight(height, time) end


---@return number
function shPlayer:getCameraHeight() end

---@param offset number
---@param time number
---@return void
function shPlayer:setCameraOffset(offset, time) end


---@return number
function shPlayer:getCameraOffset() end

---@param dist number
---@param time number
---@return void
function shPlayer:setCameraDist(dist, time) end


---@return number
function shPlayer:getCameraDist() end

---@param fov number
---@param time number
---@return void
function shPlayer:setCameraFov(fov, time) end


---@return number
function shPlayer:getCameraFov() end

---@param timeOut number
---@return void
function shPlayer:stopCameraAnim(timeOut) end


---@return shCameraAnimated
function shPlayer:getCamera() end

---@param val number
---@return void
function shPlayer:setHighlightsRadius(val) end


---@return number
function shPlayer:getHighlightsRadius() end


---@class shRigidMeshActor
local shRigidMeshActor = {}

---@param state boolean
---@return void
function shRigidMeshActor:setVisible(state) end


---@return boolean
function shRigidMeshActor:getVisible() end

---@param object shTransformActor
---@return void
function shRigidMeshActor:setPose(object) end


---@return shTransformActor
function shRigidMeshActor:getPose() end

---@param parName string
---@param value any
---@return void
function shRigidMeshActor:setMaterialParam(parName, value) end

---@param matStr string
---@return void
function shRigidMeshActor:setMaterials(matStr) end

---@param channel number
---@param texture string
---@return void
function shRigidMeshActor:setTexture(channel, texture) end


---@class shRigidEntity
local shRigidEntity = {}


---@return string
function shRigidEntity:getScriptClass() end

---@param enable boolean
---@return void
function shRigidEntity:setCollisionSlide(enable) end

---@param enable boolean
---@return void
function shRigidEntity:setCollisionRide(enable) end

---@param aspectPrefab string
---@return shEmitter | Sound | shLightOmni | shInteractor | shRigidMeshActor
function shRigidEntity:createAspect(aspectPrefab) end

---@param object shEmitter | Sound | shLightOmni | shInteractor | shRigidMeshActor
---@return void
function shRigidEntity:destroyAspect(object) end

---@param name string
---@param cycle boolean
---@return void
function shRigidEntity:playAnimation(name, cycle) end

---@param name string
---@return void
function shRigidEntity:stopAnimation(name) end


---@return void
function shRigidEntity:stopAnimations() end

---@param speed number
---@return void
function shRigidEntity:setAnimationSpeed(speed) end


---@return number
function shRigidEntity:getAnimationSpeed() end

---@param state boolean
---@return void
function shRigidEntity:setVisible(state) end


---@return boolean
function shRigidEntity:getVisible() end


---@return boolean
function shRigidEntity:isMaterialHelper() end

---@param enable boolean
---@return void
function shRigidEntity:setCollisionCCD(enable) end

---@param enable boolean
---@return void
function shRigidEntity:setCollisionRaycast(enable) end


---@return boolean
function shRigidEntity:getCollisionRaycast() end

---@param enable boolean
---@return void
function shRigidEntity:setCollisionObjects(enable) end


---@return boolean
function shRigidEntity:getCollisionObjects() end

---@param enableCharCollide boolean
---@param enableCharPush boolean
---@return void
function shRigidEntity:setCollisionCharacters(enableCharCollide, enableCharPush) end


---@return boolean
function shRigidEntity:getCollisionCharacters() end


---@return boolean
function shRigidEntity:getCollisionPush() end

---@param enable boolean
---@return void
function shRigidEntity:setDynamic(enable) end


---@return boolean
function shRigidEntity:getDynamic() end


---@return string
function shRigidEntity:getName() end


---@return string
function shRigidEntity:getPrefabName() end


---@return number
function shRigidEntity:getMeshCount() end

---@param index number
---@return shRigidMeshActor
function shRigidEntity:getMeshByIndex(index) end

---@param name string
---@return shRigidMeshActor
function shRigidEntity:getMeshByName(name) end

---@param object shTransformActor
---@return void
function shRigidEntity:setPose(object) end


---@return shTransformActor
function shRigidEntity:getPose() end

---@param matStr string
---@return void
function shRigidEntity:setMaterials(matStr) end

---@param matStr string
---@param state boolean
---@return void
function shRigidEntity:setMaterialVisible(matStr, state) end

---@param matStr string
---@return void
function shRigidEntity:addMaterial(matStr) end

---@param matStr string
---@return void
function shRigidEntity:removeMaterial(matStr) end

---@param parName string
---@param value any
---@return void
function shRigidEntity:setMaterialParam(parName, value) end

---@param channel number
---@param texture string
---@return void
function shRigidEntity:setTexture(channel, texture) end

---@param func any
---@param object any
---@return void
function shRigidEntity:subscribeAnimationStop(func, object) end

---@param func any
---@param object any
---@return void
function shRigidEntity:subscribeTouchCharacter(func, object) end

---@param func any
---@param object any
---@return void
function shRigidEntity:subscribeUntouchCharacter(func, object) end


---@class shScene
local shScene = {}


---@return shEnvirNode
function shScene:getEnvirState() end

---@param FileName string
---@return boolean
function shScene:playVideo(FileName) end


---@return void
function shScene:stopVideo() end

---@param State boolean
---@return void
function shScene:pauseGame(State) end


---@class Sound
local Sound = {}


---@return void
function Sound:play() end


---@return void
function Sound:stop() end

---@param state boolean
---@return void
function Sound:pause(state) end


---@return boolean
function Sound:isPlaying() end


---@return boolean
function Sound:isStopped() end

---@param state boolean
---@return void
function Sound:setLoop(state) end


---@return boolean
function Sound:getLoop() end

---@param time number
---@return void
function Sound:setDelay(time) end


---@return number
function Sound:getDelay() end

---@param val number
---@return void
function Sound:setDistance(val) end


---@return number
function Sound:getDistance() end

---@param val number
---@return void
function Sound:setVolume(val) end


---@return number
function Sound:getVolume() end

---@param val number
---@return void
function Sound:setFadeIn(val) end

---@param val number
---@return void
function Sound:setFadeOut(val) end

---@param val number
---@return void
function Sound:setSpeed(val) end


---@return number
function Sound:getSpeed() end

---@param object shTransformActor
---@return void
function Sound:setPose(object) end


---@return shTransformActor
function Sound:getPose() end


---@class shEventTimer
local shEventTimer = {}


---@return void
function shEventTimer:fire() end


---@return void
function shEventTimer:stop() end


---@return number
function shEventTimer:getTimeLeft() end


---@return number
function shEventTimer:getTimeAmount() end


---@return number
function shEventTimer:getTimeDuration() end


---@class shTransformActor
local shTransformActor = {}

---@param pos vec3
---@return void
function shTransformActor:setPos(pos) end


---@return vec3
function shTransformActor:getPos() end

---@param rot vec3
---@return void
function shTransformActor:setRot(rot) end


---@return vec3
function shTransformActor:getRot() end

---@param scale vec3
---@return void
function shTransformActor:setScale(scale) end


---@return vec3
function shTransformActor:getScale() end

---@param pos vec3
---@return void
function shTransformActor:setLocalPos(pos) end


---@return vec3
function shTransformActor:getLocalPos() end

---@param rot vec3
---@return void
function shTransformActor:setLocalRot(rot) end


---@return vec3
function shTransformActor:getLocalRot() end

---@param scale vec3
---@return void
function shTransformActor:setLocalScale(scale) end


---@return vec3
function shTransformActor:getLocalScale() end

---@param pActor shTransformActor
---@return void
function shTransformActor:setParent(pActor) end


---@return shTransformActor
function shTransformActor:getParent() end

---@param object any
---@return void
function shTransformActor:setRotQuat(object) end


---@return any
function shTransformActor:getRotQuat() end


---@return void
function shTransformActor:resetPose() end


---@return void
function shTransformActor:resetPos() end


---@return void
function shTransformActor:resetRot() end


---@return void
function shTransformActor:resetScale() end

---@param object any
---@return void
function shTransformActor:setLocalRotQuat(object) end


---@return any
function shTransformActor:getLocalRotQuat() end


---@return void
function shTransformActor:resetLocalPose() end


---@return void
function shTransformActor:resetLocalPos() end


---@return void
function shTransformActor:resetLocalRot() end


---@return void
function shTransformActor:resetLocalScale() end

---@param vec3From any
---@param vec3To any
---@return void
function shTransformActor:setOrientation(vec3From, vec3To) end


---@return void
function shTransformActor:resetParent() end


---@class shTrigger
local shTrigger = {}


---@return string
function shTrigger:getName() end


---@return string
function shTrigger:getScriptClass() end

---@param object shTransformActor
---@return void
function shTrigger:setPose(object) end


---@return shTransformActor
function shTrigger:getPose() end


---@class shWeapon : shItem
local shWeapon = {}

---@param radius_ number
---@return void
function shWeapon:setRadius(radius_) end


---@return number
function shWeapon:getRadius() end

---@param length_ number
---@return void
function shWeapon:setLength(length_) end


---@return number
function shWeapon:getLength() end

---@param enable boolean
---@return void
function shWeapon:setOffset(enable) end


---@return number
function shWeapon:getOffset() end

---@param raduis_ number
---@param length_ number
---@return void
function shWeapon:setDimensions(raduis_, length_) end


---@class vec2
---@field public x number
---@field public y number
local vec2 = {}

---@class vec3
---@field public x number
---@field public y number
---@field public z number
local vec3 = {}

---@class vec4
---@field public x number
---@field public y number
---@field public z number
---@field public w number
local vec4 = {}

---@class quaternion
---@field public x number
---@field public y number
---@field public z number
---@field public w number
local quaternion = {}

---@class COnHitParams
---@field impactor CItem | CGun | CWeapon
---@field impactType string @("ranged", "melee", "explosion")
---@field impactPos vec3 @impact position
---@field impactForce number @set by engine, can be changed
---@field impactRadius number @set by engine, can be changed
---@field target shCharacter | shRigidEntity @target object (character, rigid)
---@field targetType string @target type ("character", "rigid")
---@field interrupt boolean @defaults to false. if set to true - stops hit event propagation


-- global functions

---@param windowLayout string
---@param textureTarget string
---@param replaceTexture boolean
---@return any
function createGUIContext(windowLayout, textureTarget, replaceTexture) end


---@return vec2
function getScreenSize() end


---@return number
function getFrameRate() end


---@return number
function getFrameTime() end

---@param time number
---@param object any
---@param callback function
---@param _repeat boolean
---@return shEventTimer
function runTimer(time, object, callback, _repeat) end

---@param time number
---@param object any
---@param callback function
---@param _repeat number
---@return shEventTimer
function runTimerExt(time, object, callback, _repeat) end

---@param LocFileName string
---@return void
function changeLocation(LocFileName) end


---@return void
function reloadLocation() end


---@return void
function exitLocation() end


---@return void
function exitGame() end

---@param fileName string
---@return boolean
function loadGame(fileName) end

---@param fileName string
---@return boolean
function saveGame(fileName) end

---@param fileName string
---@return boolean
function deleteGame(fileName) end


---@return boolean
function isLoadingGame() end

---@param dialogName string
---@param paramName string
---@param paramValue any
---@return void
function setDialogParam(dialogName, paramName, paramValue) end

---@param dialogName string
---@param paramName string
---@return any
function getDialogParam(dialogName, paramName) end

---@param questName string
---@param paramName string
---@param paramValue any
---@return void
function setQuestParam(questName, paramName, paramValue) end

---@param questName string
---@param paramName string
---@return any
function getQuestParam(questName, paramName) end

---@param paramName string
---@param paramValue any
---@return void
function setGlobalParam(paramName, paramValue) end

---@param paramName string
---@return any
function getGlobalParam(paramName) end


---@return any
function getGlobalParams() end


---@return any
function getDialogParams() end


---@return any
function getQuestParams() end

---@param speed number
---@return void
function setGameSpeed(speed) end


---@return number
function getGameSpeed() end


---@return number
function getGameTime() end


---@return void
function resetCursorPos() end

---@param Text string
---@return void
function TPrint(Text) end

---@param object any
---@return void
function setPlayer(object) end


---@return CPlayer | CMainCharacter
function getPlayer() end

---@param object any
---@param target any
---@return number
function getDistance(object, target) end

---@param object any
---@param target any
---@return number
function getDistanceFlat(object, target) end

---@param object any
---@param target any
---@param refSignVector any
---@return number
function getAngle(object, target, refSignVector) end

---@param object any
---@param target any
---@return number
function getAngleUnsigned(object, target) end

---@param quat quaternion
---@return vec3
function getAnglesFromQuat(quat) end

---@param object vec3
---@param target vec3
---@return number
function dotProduct(object, target) end

---@param object vec3
---@param target vec3
---@return vec3
function crossProduct(object, target) end

---@param object1 vec2
---@param object2 vec2
---@return vec2
function vec2Add(object1, object2) end

---@param object1 vec3
---@param object2 vec3
---@return vec3
function vec3Add(object1, object2) end

---@param object1 vec4
---@param object2 vec4
---@return vec4
function vec4Add(object1, object2) end

---@param object1 vec2
---@param object2 vec2
---@return vec2
function vec2Sub(object1, object2) end

---@param object1 vec3
---@param object2 vec3
---@return vec3
function vec3Sub(object1, object2) end

---@param object1 vec4
---@param object2 vec4
---@return vec4
function vec4Sub(object1, object2) end

---@param object1 vec2
---@param object2 vec2
---@return vec2
function vec2Mul(object1, object2) end

---@param object1 vec3
---@param object2 vec3
---@return vec3
function vec3Mul(object1, object2) end

---@param object1 vec4
---@param object2 vec4
---@return vec4
function vec4Mul(object1, object2) end

---@param object1 vec2
---@param object2 vec2
---@return vec2
function vec2Div(object1, object2) end

---@param object1 vec3
---@param object2 vec3
---@return vec3
function vec3Div(object1, object2) end

---@param object1 vec4
---@param object2 vec4
---@return vec4
function vec4Div(object1, object2) end

---@param object vec3
---@return number
function vec3Length(object) end

---@param object vec3
---@return vec3
function vec3Normalize(object) end

---@param vector vec3
---@param angles vec3
---@return vec3
function vec3RotateEuler(vector, angles) end

---@param vector vec3
---@param quat quaternion
---@return vec3
function vec3RotateQuat(vector, quat) end

---@param angles vec3
---@return quaternion
function quatFromEuler(angles) end

---@param axis vec3
---@param angle number
---@return quaternion
function quatFromAxis(axis, angle) end

---@param dir1 vec3
---@param dir2 vec3
---@return quaternion
function quatFromDirs(dir1, dir2) end

---@param quat1 quaternion
---@param quat2 quaternion
---@return quaternion
function quatRotateQuat(quat1, quat2) end

---@param quat1 quaternion
---@param quat2 quaternion
---@param factor number
---@return quaternion
function quatSlerp(quat1, quat2, factor) end

---@param quat quaternion
---@return quaternion
function quatInverse(quat) end

---@param point vec3
---@return vec2
function projectPointToScreen(point) end

---@param screenPos vec2
---@param checkPlayers boolean
---@return shCharacter
function raycastCharacterOnScreen(screenPos, checkPlayers) end

---@param screenPos vec2
---@return shRigid
function raycastRigidOnScreen(screenPos) end

---@param screenPos vec2
---@param distance boolean
---@param closestToFocus boolean
---@return shInteractor
function raycastInteractorOnScreen(screenPos, distance, closestToFocus) end

---@param distance number
---@return shInteractor[]
function getInteractorsInView(distance) end

---@param objectPos any
---@param objectDir any
---@param targetPos any
---@param angle number
---@param distance number
---@return boolean
function checkPointInSector(objectPos, objectDir, targetPos, angle, distance) end

---@param objectPos any
---@param objectDir any
---@param targetPos any
---@param targetRadius number
---@param angle number
---@param distance number
---@return boolean
function checkSphereInSector(objectPos, objectDir, targetPos, targetRadius, angle, distance) end

---@param trackName string
---@param fadeInTime number
---@return number
function trackPlay(trackName, fadeInTime) end

---@param paused boolean
---@return void
function trackPause(paused) end


---@return number
function trackLength() end

---@param state boolean
---@return void
function setMouseYInvert(state) end


---@return boolean
function getMouseYInvert() end

---@param val number
---@return void
function setMouseSensitivity(val) end


---@return number
function getMouseSensitivity() end

---@param val number
---@return void
function setPlayerFov(val) end


---@return number
function getPlayerFov() end


---@return any
function getScreenResolutions() end


---@return any
function getScreenResolution() end


---@return any
function getGameResolution() end

---@param object any
---@return void
function setGameResolution(object) end

---@param fullscreen boolean
---@return void
function setFullscreen(fullscreen) end


---@return boolean
function getFullscreen() end

---@param value number
---@return void
function setShadowQuality(value) end


---@return number
function getShadowQuality() end

---@param value number
---@return void
function setTextureLodBias(value) end


---@return number
function getTextureLodBias() end

---@param cam shCameraAnimated
---@return void
function activateCamera(cam) end

---@param groupName string
---@param reqursive boolean
---@return any
function getObjectsInGroup(groupName, reqursive) end


---@return void
function blockUserControl() end


---@return void
function returnUserControl() end

---@param path string
---@param folders boolean
---@param files boolean
---@return any
function getFolderElements(path, folders, files) end

---@param path string
---@param folders boolean
---@param files boolean
---@return any
function getDocumentsElements(path, folders, files) end

---@param path string
---@param folders boolean
---@param files boolean
---@return any
function getSavegamesElements(path, folders, files) end

---@param code number
---@param separateHands boolean
---@return number
function scanCodeToVirtualKey(code, separateHands) end

---@param key number
---@return number
function virtualKeyToScanCode(key) end


---@return string
function getDocumentsFolder() end


---@return string
function getSavegamesFolder() end
