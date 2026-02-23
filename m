Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DA017BA6
	for <sophgo@lists.linux.dev>; Mon, 23 Feb 2026 00:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771805528; cv=none; b=qUR+E4y7LRXK9CBMlBdFguK1H8HYNmjd1CRIFyRvku9QFE8OzcnZXG1wmczyUsHkdDZweRUvGX0LLd/ezrtx5RKzDFqm5vliWdb5Mziy3HHX2wqKN27bmWoP4P8sGS3BhlpymbcarVBeDzl/OO9cOjmnHFQYPOCHXuI7ndGJSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771805528; c=relaxed/simple;
	bh=8Q5y8U7qqQeIu9CIhdT2hDo15btgbsbWGqFIvIoUBDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTTiTWuGWKPsKUMiBnWUhf7IwRsyB5y0up8tu35qMOKBroFW/YdTB6PYwgMUuTAzOuWLvRawJEl7RG7sPvJ+8cI6eL1utJwtL+qlEyUBE7TCwdXzW4GXPoogHRQkeCvZ1rj5e55a7jzkVz2M9s29jU1qiciXA6Y32qt/HpSx02c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TBAgqctW; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TBAgqctW"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-40ee8b4f925so2556428fac.3
        for <sophgo@lists.linux.dev>; Sun, 22 Feb 2026 16:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771805524; x=1772410324; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=TBAgqctWUF1sdew3ZBok/8mqAbcsrun6yeHuiThmSUIwsDybFdF2zrfCV0HNLQ85WO
         NjtlUZW8qAFpa1hONx8dOQ/gL+VB8F1JCvPhsmkbc7Cy4LAy2JRaP4bDqkKksrBEPsFh
         2tomrTiHg8A0Pfp8CXAPZrcPpmYGBalwm62OtZOz3q1urgbvtOQf5JxzGd5FTD9jQre3
         29h4eczOV4rQ0vL1jFnmSf8e6sNc4veQ/8DL4UQUFJm5YIZO3ZqW+VBVDoTmU0XBW4k3
         lNaoPHQSaj+ze1PrFMuPfNkn8RyQEgjT0b4r8OVWPVny1eo2KBWRhgtX1EgxRy3cxgm8
         FDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771805524; x=1772410324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=IGU8pblivRuiQE54fUDzl7Ki5pWtkOZTqZ4eKzwZWjsB8vEhqjB6/wmxyJqgzm62n4
         KW/YnCsdx7iShDWU2oTyIzJSaAbz5X8AeVm10prU1fwJBAjvEe9kWE186xPRVKQJQlTY
         iilyoD5/DgCvERXJZy6s2XDrNBD6IeIk1PDVTq94fNzHo/CQ4S5EW90/WSKyeiTAxq08
         4aAaAgEu7JoO6xr8rgNaa0GYc/yAGYzfL5L19JC8rI98Z5RVQS0f7979+JigDKETGLQy
         bHKEmvX5adzwwqDNm9If4EKHViTVi0uTNDEI8Y70DY0b5TeaET3aN6zQ0nnvRKrf5GtH
         7Dxw==
X-Forwarded-Encrypted: i=1; AJvYcCU54/XvD31LNHjCCA+KDFoiumKrIkFEHIGodA76E4ep5NDaDgAtKi6fthKLF/PQb3AZOHK3CIM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzD7spyRJToPUw6KNROpW4PuWKrvckiJeZr+ip2uY7EVkVc5+0o
	aHqnyB8cbmUlti1uq5C/iJ8YiU+LxbVFvtRXcW0Uoh0bLXspH4ME448of/wk3vff9sw=
X-Gm-Gg: AZuq6aJ/5j698ZtCNHHI6z5N5Fn55/6DXE3Jf12ih8W3CisL+GWtt+aO8SYwJVsPC2u
	A/L7mrHZt8Q3EGHIoMAFkOwoE7/AygNN807MkGUftySgMy1HdO+2+IjN9UTPlJGS1jqeAdtSWGg
	d2Vpm3jxpHLBxVp4+WmsMicQt6KX+mxGBY6zGYyCaPR071N2X2wGjnVCZL6WEefgAeUJf73j50s
	FvSgB+3CWgWb2JGw3tVDVp9eMzTT8jw3c/ElsqNvY1pPkto+EsIiPu63mDKUIT2hUcdHm2rD/4b
	7Tftn5D/lT6ANJq5NwIx10dluw7e3cBEkoXR351BJhFmJDxVH4hIgshADZ/2tQhZvZqrg4PsQYG
	9XDdBxy7duOhR8KOJ8eHAC72xHrjizsQLAHI10pLSf1tC6Ioy0AGOBSnoYVPjUqyN6vEbqCO6Vs
	sx0xVJ43Trv+52d/EEoLnSaLC56DXnY9KPFKZtkUSYkoVCO+XgDRwTCWNN6Ib+M0uAP07cbhc=
X-Received: by 2002:a05:6870:f61b:b0:409:794e:fe9 with SMTP id 586e51a60fabf-4157b1b3fd3mr3557313fac.54.1771805524220;
        Sun, 22 Feb 2026 16:12:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e37:2309:3937:4469? ([2600:8803:e7e4:500:e37:2309:3937:4469])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157ca3df7fsm6409978fac.0.2026.02.22.16.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 16:12:02 -0800 (PST)
Message-ID: <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
Date: Sun, 22 Feb 2026 18:12:00 -0600
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
 <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/18/26 12:09 PM, Krzysztof Kozlowski wrote:
> Simplify error handling by removing two mutex_unlock() calls with
> scoped_guard().
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index e44ef262beec..bbe1cf712965 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,

Filling in some context from the existing code...

	for (i = 0; i < num_configs; i++) {
		param = pinconf_to_config_param(configs[i]);
		arg = pinconf_to_config_argument(configs[i]);

		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
			/*
			 * Check for gpio driver not being probed yet.

>  			 * The lock makes sure that either gpio-probe has completed
>  			 * or the gpio driver hasn't probed yet.
>  			 */
> -			mutex_lock(&bank->deferred_lock);
> -			if (!gpio || !gpio->direction_output) {
> -				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
> -								arg);
> -				mutex_unlock(&bank->deferred_lock);
> -				if (rc)
> -					return rc;
> -
> -				break;
> +			scoped_guard(mutex, &bank->deferred_lock) {
> +				if (!gpio || !gpio->direction_output) {
> +					rc = rockchip_pinconf_defer_pin(bank,
> +									pin - bank->pin_base,
> +									param, arg);
> +					if (rc)
> +						return rc;
> +					break;

I think there is an unintentional change here.

scoped_guard() is implemented by a for loop. So the break statement is now
breaking out of the scoped_guard() scope rather than breaking out of the
outer for loop.

> +				}
>  			}
> -			mutex_unlock(&bank->deferred_lock);
>  		}
>  
>  		switch (param) {
> 

