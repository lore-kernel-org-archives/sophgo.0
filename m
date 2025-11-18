Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F1130FC23
	for <sophgo@lists.linux.dev>; Tue, 18 Nov 2025 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457273; cv=none; b=Ru+GbqVC86llWZXLEzGiTK2Qk6vmnBpWzdPKf2H5Pme4R4u27D78FlGbR0xpqtpBnykTwBRxIqR9q8rhzBzjM+ZNSh4X8EkX3naU8kBrn7u8QajRXvwNsYHNuMOpvjSMytzosBdrJR16OA14va+PAX/mTWaElANk/glsaNIRY9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457273; c=relaxed/simple;
	bh=NffHz/XV6JKNZ+VAmwZgaaYiD4RyWpTuYO0Ki2AKik0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkXpaGr8nkjLMJ6G4TYp/vuVJ1fMTjXLJYYh/3aJfRsN7DlqH3EaYzXZyh3Z05rRMEwTpi8ozOsrj78GVxp7TjybHxRmqHbeTTzy57wNkywt4XWRP7C3Yd2huXOP+9RRk008Lk25hQQaSZ4lMvPZauAbK/RDci4JLJ/wLGOcNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDrG7MRe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDrG7MRe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477aa218f20so3057005e9.0
        for <sophgo@lists.linux.dev>; Tue, 18 Nov 2025 01:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763457270; x=1764062070; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3N5hqBw4YuQUI6OD6kMyFDi2pJCVVPnIbRp4ozdzkU=;
        b=yDrG7MReiZocxeFeuXACkNcwS2/8rpPyWI6O63AI21P9tFdQ86tiEqleZUimqKiIUp
         VWQm1tF7tIlIGbkesPX5xTOInPR0vHhVKnIf0fw2Ws9MPrTL/ZcQUmFpz12F6ErnGx0T
         yixgoHKitxlnAhy2z/CbZD8l46X7jNxo5s8ILJ1b2FmoDM+ykGZjgbYjT7FKuowi8fsW
         iZ4lGd+WQkAwdhJjmdqsTAwELmEEtLbrA07LGuh7+B5B4iEaytQd778Gx9v6LDTBKzZh
         SiLSLnNvnnZ55aTD7JAfG+Vc6I6VwiWZUE+vuWsZeW2x5JiGW3jYb2P7L0ZbyVimbrue
         onXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763457270; x=1764062070;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3N5hqBw4YuQUI6OD6kMyFDi2pJCVVPnIbRp4ozdzkU=;
        b=tyo572QR+ubqqGn9fXaGytzvzx+StmRqhwRtx1H1a1O9Mtbg04RUWaiqA8OOzJm8XM
         9EZ73qK4TybVnjwNyJ+1H+nENmiAqSIsCbTZ/lKLD7rBzSLr9chWxs79J2sR9S1blPtd
         8WTnqgjHIh/R7LoQteoOOFVLYDHRVp92aOxdTLRTRwxNOud0wiaCPWMhX9kqbRScTbUY
         umbKYzZkFNwz9Iwuyc+mor3Mm83Y+4dar7rKFYbo1imlTbAgsj5+DuDOEYlSnGLZD7oR
         71z/im5SxaHZiRIGwGeREWURc20ATbP+8c5rD5lmB+kbVy5vUGiK/0cUI5IlsKxF5f9q
         HgjA==
X-Forwarded-Encrypted: i=1; AJvYcCUVV5Mppx2xiiQ5vbH7jQ9uwUqYOrGbZwJKg8Z04sfVUudNMBBN712KC1tESDYJryHwFFP+DRU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHUl6OH66wvma1JwQin9p8LUMAF7POXTQhMCMUIjsDI+NO9vqK
	+tBXRXFxwaddVYmloNHv5JeUJbstWI2E07YEC2chf74bKG1s/IUm3hz+s+CciOD2Buk=
X-Gm-Gg: ASbGncsa0paNEN+dfy8Cg390fv5jQwegWceqFRPdZGoA32azdfw98Y+S9YcOcmIp11i
	3iUdKCRck3EuN90RgMir4s83ADoNMdi8WkrW8Ci0r2EoesbRqQruNgnjb8kON057kuD4tjFoq5A
	iTcQTaoBnuy9K2g2ElNzRpRL1WYn49Fiyer2eYINALgcNIuwk6UYsJOTzhicHL0XbE2c3oNZ3Jh
	phveZvQtf0l6JG3S8RN9LvEMWky/eHcdfKOrfdkfy7QcpTyEIqpznjtyR+SVhQ3ovuaoB5IS3u3
	fLhOosATTLWUzQZTxxweKiD1WQ51mGhi4woMhOChVN9o6iL2I14MlfSigdFSJjZLhVdghCCH8mR
	MsLkZZdhg/k0LxsHlboz7PkwPrqbS3gQth0UJK15iEj+2B+J4VeUzet2K154E5RoXMVeOBAtqUy
	6v55gQWi6x2Fmh7ymQIEJbPHGV/6Nh6RrBJ833BsUgGM6yqy4BfZ3+HmVkCGCivAQ=
X-Google-Smtp-Source: AGHT+IH6ib3d5rciAJC4eTNhjx8/U5TUqIfq48PmsHJikA0X6/m6wB4HAuTtPaKSyY/rh970/y9Isg==
X-Received: by 2002:a05:600c:4585:b0:477:7725:c16a with SMTP id 5b1f17b1804b1-4778fe5717amr155708005e9.10.1763457269995;
        Tue, 18 Nov 2025 01:14:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm190268035e9.13.2025.11.18.01.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:14:29 -0800 (PST)
Message-ID: <ae893084-a1e3-4f73-bdac-1474d107f66d@linaro.org>
Date: Tue, 18 Nov 2025 10:14:28 +0100
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/1] phy: sophgo: Remove unused of_gpio.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-phy@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Chen Wang <unicorn_wang@outlook.com>
References: <20251112085220.1452530-1-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251112085220.1452530-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/25 09:52, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/phy/sophgo/phy-cv1800-usb2.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
> index 64f8e37b4b52..6fe846534e9c 100644
> --- a/drivers/phy/sophgo/phy-cv1800-usb2.c
> +++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
> @@ -11,7 +11,6 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
> -#include <linux/of_gpio.h>
>   #include <linux/platform_device.h>
>   #include <linux/phy/phy.h>
>   #include <linux/regmap.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
