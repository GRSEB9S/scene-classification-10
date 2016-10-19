folder = dir('/home/xinshuo/scene_images'); 
file = dir(sprintf('/home/xinshuo/scene_images/%s', folder(3).name));

train_imagenames = cell(1000*8, 1);
for i = 1:8
	file = dir(sprintf('/home/xinshuo/scene_images/%s', folder(i+2).name)); 
    
    for j = 1:1000
        train_imagenames{(i-1)*1000+j} = sprintf('%s/%s',folder(i+2).name, file(j+2).name);
    end
end