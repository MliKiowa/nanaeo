---
title: 高斯滤波
date: 2022-08-14
categories:
    - DevLog
tags:
    - DevLog
    - Gauss
---
高斯滤波的实现

<!-- more -->

## 本文提示
本文提供了相关代码和算法仅为示例学习，并非标准案例，并且OpenCV提供了高斯滤波函数，如果遇到不明白的概念和地方可以参考引用文章理解，也可以尝试在搜索引擎上搜索相关概念和图片示例，由于本站资源原因，暂不提供图片。

tips: 本文为了方便仅是灰度图片处理
如果需要彩色图片应该尝试修改代码三种通道进行分别处理或其它方法。
## 概念理解(部分来自百科等)
### 滤波
滤波就对图像像素点及其邻域点的灰度值按照一定的参数规则进行加权平均，可以有效滤去理想图像中叠加的高频噪声。常用的滤波有线性滤波、中值滤波、均值滤波、双边滤波、高斯滤波等。滤波有抑制噪声的作用，但这会使得图像边缘模糊。(摘自别的地方)
### 低通滤波
低通滤波是一种过滤方式，规则为低频信号能正常通过，而超过设定临界值的高频信号则被阻隔、减弱，图像处理领域可用来模糊。
### 高通滤波
高通滤波(high-pass filter) 是一种过滤方式，规则为高频信号能正常通过，而低于设定临界值的低频信号则被阻隔、减弱。但是阻隔、减弱的幅度则会依据不同的频率以及不同的滤波程序(目的)而改变，图像处理领域可用于锐化。
### 高斯滤波
高斯滤波是一种线性平滑滤波，适用于消除高斯噪声，广泛应用于图像处理的减噪过程，对处理呈现正态分布(高斯分布)的噪声(包括图像噪声)效果显著。
tips: 常用高斯模糊就是使用高斯滤波完成的， 高斯模糊是低通滤波的一种， 也就是滤波函数是低通高斯函数， 但是高斯滤波是指用高斯函数作为滤波函数， 至于是不是模糊，要看是高斯低通还是高斯高通， 低通就是模糊， 高通就是锐化。
### 核算子、模板、结构都是一种
当我们进行图像处理时时，使用到的权用一个矩阵表示，可以利用该矩阵计算对应像素，同时我们叫这个矩阵为核算子、模板、结构。(示例见前提指明)
大小可小可大，并且一般为奇数，
Que:核大小为什么是都是类似3×3/5×5 奇数呢?
其中一个原因是定位中心锚点，偶数是无法确定中心点的。
### 滤波核
当进行滤波时，里面是核的内容是权重并且可以用于处理像素，那么该核称为滤波核。
(通俗解释 专业解释 请查询资料)
### 归一化
就是生成核或者说模板加起来的权不为一，这时候我们核内每一个值除以核内总值，就实现了归一化。
### 卷积核
如果一个核被用于卷积那么该核也可以被称为卷积核。(通俗解释 专业解释 请查询资料)
### 高斯核
那么高斯核固然就是高斯分布生成的核了
## 环境与依赖
Python        本次使用的编程语言
OpenCV        跨平台计算机视觉库
Windows11     本文中代码运行系统
### OpenCv库安装
(清华源 可自行切换)
```
pip install opencv-python -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
pip install opencv-contrib-python -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
```
## 举例
最终滤波核示例 (提示:权请保证和为1 此处已经归一化 但并非真实情况)
0.1 0.1 0.2
0.1 0.1 0.1
0.1 0.1 0.1

为3×3网格坐标结构
该模板大小 3×3
## 算法过程
### 高斯滤波实现方法
看完以上相信各位并没有很多理解，并不要紧，联系实际我们进一步进行
高斯滤波通常情况下有两种实现方式，一是用离散化窗口滑窗卷积， 另一种通过傅里叶变换，其中第一种毕竟常见，可能这时候有人又问了，这又是什么，别急，咱先慢慢来，离散化窗口滑窗卷积其实就是进行有限次的移动核运算区域的卷积运算，那么我们可以开始了。
### 算法过程
0.图像灰度处理 (为了方便)
1. 生成滤波核
2. 进行卷积处理图像

### 生成滤波核
![CodeCogsEqn.gif](https://s2.loli.net/2022/08/14/4dgAQ2RCInSM8m6.gif)
(此处为一维高斯函数)

sigma 为标准差 图像平滑程度取决于该值
我们使用高斯函数进行生成对应滤波核
离中心点越远那么边缘值的权值越小，我们依照高斯二维函数就可以生成对应滤波核。
代码具体参考如下
```
def GaussKernel(size,k,sigma):
    _t = np.zeros((size,size),np.float32)
    for i in range (size):
        for j in range (size):
            norm = math.pow(i-k,2) + pow(j-k,2)
            _t[i,j] = math.exp(-norm/(2*math.pow(sigma,2)))/2*math.pi*pow(sigma,2)
    sum = np.sum(_t)
    kernel = _t/sum
    return kernel
```
### 卷积生成
然后我们使用对应的滤波权值进行乘以像素值，就可以生成新值，但是滤波核仅3×3大小，我们在原图像每一个像素点运算一次，即可生成新的图形。
运算为: 每个像素点周围点 权×值 的和为中心点新值。
```
def mygaussFilter(img_gray,kernel):
    h,w = img_gray.shape
    k_h,k_w = kernel.shape
    for i in range(int(k_h/2),h-int(k_h/2)):
        for j in range(int(k_h/2),w-int(k_h/2)):
            sum = 0
            for k in range(0,k_h):
                for l in range(0,k_h):
                    sum += img_gray[i-int(k_h/2)+k,j-int(k_h/2)+l]*kernel[k,l]
            img_gray[i,j] = sum
    return img_gray
```
## 样例代码
```
import math
import cv2
import numpy as np
def GaussKernel(size,k,sigma):
    _t = np.zeros((size,size),np.float32)
    for i in range (size):
        for j in range (size):
            norm = math.pow(i-k,2) + pow(j-k,2)
            _t[i,j] = math.exp(-norm/(2*math.pow(sigma,2)))/2*math.pi*pow(sigma,2)
    sum = np.sum(_t)
    kernel = _t/sum
    return kernel

def mygaussFilter(img_gray,kernel):
    h,w = img_gray.shape
    k_h,k_w = kernel.shape
    for i in range(int(k_h/2),h-int(k_h/2)):
        for j in range(int(k_h/2),w-int(k_h/2)):
            sum = 0
            for k in range(0,k_h):
                for l in range(0,k_h):
                    sum += img_gray[i-int(k_h/2)+k,j-int(k_h/2)+l]*kernel[k,l]
            img_gray[i,j] = sum
    return img_gray

if __name__ == '__main__':
    img = cv2.imread("demo.jpg")
    img_gray = cv2.cvtColor(img,cv2.COLOR_RGB2GRAY)
    img_g = img_gray.copy()
    k=1
    size = 2*k+1
    kernel = gausskernel(size,k,1.5)
    print(kernel)
    img_B,img_G,img_R = cv2.split(img)
    img_gauss_B = mygaussFilter(img_B,kernel)
    img_gauss_G = mygaussFilter(img_G,kernel)
    img_gauss_R = mygaussFilter(img_R,kernel)
    img_gauss = cv2.merge([img_gauss_B,img_gauss_G,img_gauss_R])
    img_comp = np.hstack((img,img_gauss))
    cv2.imshow("gauss",img_comp)
    cv2.waitKey(0)
```
## 直接OpenCV操作(非原理实现方案 使用封装方法)
```
import cv2
Gn=cv2.imread("Gaussian_noise.jpg") 
Gf=cv2.GaussianBlur(Gn,(3,3),0,0)
cv2.imshow("噪声图像",Gn)
cv2.imshow("滤波图像",Gf)
cv2.waitKey()
cv2.destroyAllWindows()
```
## Que: 边界点的处理
如果一个点处于边界，周边没有足够的点，怎么办？
一个变通方法，就是把已有的点拷贝到另一面的对应位置，模拟出完整的矩阵。
当然我们这里很简单，就是进行矩阵补零上去，用零进行模拟完整矩阵。
## 总结
高斯滤波可以让图像高斯噪声降低，并且平滑图像，并且opencv等库已经提供封装，我们可以很快的使用
## 文章引用
高斯滤波
https://blog.csdn.net/weixin_51571728/article/details/121527964
高斯滤波核
https://blog.csdn.net/qqq777_/article/details/112800310
有关线性滤波、滤波核的基本概念(概念理解)
https://blog.csdn.net/weixin_42664622/article/details/103672899
数字图像处理基础 — 高斯滤波
https://zhuanlan.zhihu.com/p/82569305
图像滤波原理(不推荐)
https://view.inews.qq.com/a/20220425A06HHF00
## 提示
该文章并不准确，如果有错误请积极指出。
