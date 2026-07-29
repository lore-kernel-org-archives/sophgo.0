Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85807277CA5
	for <sophgo@lists.linux.dev>; Wed, 29 Jul 2026 01:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288804; cv=none; b=pPdIOF35sjJ1/rCSptkKmY9Qk7/YzlH6onat2hXjIVsEi3zFEPK8DSM6RfIu8wrvnqyrEYzbPslhCLzDkr27mptJO7308jKTdQwAfqsTpjjDaZoFYmJiaxjFecR0wyQbgRuyx3/gRSR/r0I8/+NMaiYIaPWOfc7rUDTKF3dU5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288804; c=relaxed/simple;
	bh=SkCx3j5OWK8cRKkNE4gK2DCWeBt/zckisJ2qwGPjxMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOiuvH5bIKzAUh8jSi1C7Uvuq3cak9ObO4dOUir/sFMenkTkOge+BxTr49Bc4vyM+7lVDU/7VMn00eC/JVd+UysuGVTtzPp0WI9Mh8KEq62zv64uwfiqAvRhL70v26Tneqmwb+16yM6BdDnAB3gWNEpK8UmcBKnwarCgdFgv/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NA4T/e1h; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NA4T/e1h"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8485b358552so465767b3a.2
        for <sophgo@lists.linux.dev>; Tue, 28 Jul 2026 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288803; x=1785893603; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GM5L/RCtIKftte5HNn5DkACBL6uoAu93LpRcVTfZgFA=;
        b=NA4T/e1hVcOeOAqy8OwGhw6tD0lj931W6qFB0SH+Kv4xQeE2KUyxxqXAKXQ0pV9KgL
         ScKlyQ9r5Ccv4efYBz+K85YrBWpgy98M5rD3exI3+6/D0vmguMcSQnLxU9WpstH2l54E
         +Oe4zieiJudOvzpLnkQ+tmAyypra3g0xS6g8nHHK/HIv6Jcbdyu2d6H1H2EsKAd1v2JM
         SQLzBIgxH/wxhcRwE7xIelPpwz1tK991EQO6yXWhSGRfRh8yyW0Du/nvF+GEpddGZ1KI
         PLK/ecGguq2G2H4Lk7hfwdTSS30TVSc3u38NkJEEAERBRIzqsIl/uZmevGGeUD2hxArZ
         QQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288803; x=1785893603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GM5L/RCtIKftte5HNn5DkACBL6uoAu93LpRcVTfZgFA=;
        b=WVqssCZUKTMyWYee49f0tPdszYfQls00w4Recad26bOmrXtesBdt8cUeTWaWC6+fYT
         5o0hxu6mVJ/I7BDYXcLPb9q7jpHyACJlzx3B+Sn6u5FAeK5AXQteb9UH+BDxCt+1gyAI
         azygOJZMC0fFZJiLJkJ8TdBWxWeUlA91OexLfzG8TEKboSha5sLjRnrVlfmlhErZ+66r
         8omo1jfr/LOwl9ct0TYnBCb3FOg9mLbp0MDbUM3wyXWnwXHzUID7S2nDT3bHa1j/REri
         KgYfPm76t71AjVPHkijULHR4OzTE0dRLKjn3kZESUbD2V8QWiaRs1OTBOppPiutapn6D
         tJhg==
X-Forwarded-Encrypted: i=1; AHgh+Rpnoy/eTDSwNeKM3m4cdbt49hIpOK/Ttn/13ig+aKucPzIrTyELGoqTejHBdfpx8nIEidMC42g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTccUHhmHqvhG2zgO9t7qFmsFUNu3mkr/OtZg58F/9JK+7GrXH
	I4S+Q4McZHi4TsnpayTKGiAzFlY/XvOcY7j/n9dx4He4Yd2X5hmeq98N
X-Gm-Gg: AR+sD11iMjAVCKh7oRMBfqnbUVjiDKKxbve9xx5wedrOGXAdMQJ13pcZ8gDPYtUxoAN
	DBp+//UVGRX7EKV02sBtR9CC+dq006r+bjUgVvfCoUzmJ/1LNRBBDKncEQ7+8E42cCzoLKR3Wtp
	uySibuGkjdH06cVYstIP0LwP4mDe+qzAMlNKMQvM9Vhp9vEoQpKBHVgghGhoT+SlObRXS/SNh2R
	eawYPrPT1jK0mD1oNmVMF4yrDR/u3e9LvENu72uSXnIUp9KuVkmdx+En8mfUsG27WUPiR6LUr68
	0X/QfoT0VrG9yp25zU+EfTvxeCbCePLGtvC4rAlEN0knX6/c8hlWkWJPWyUlb20/SQBtQ/ZoEN7
	8DdP7tZOdXaOjvlpeH6HOOCSWLaldy0jMzMzvAJL780eQWu9yMVa8QLnOGY8IO7V6Y9VSTiRlc8
	zXmrt4yNlDqx5QHExlW4NLm6ErCup8619im7BQVWd4lGIEqXZRnrq17OLNGAI=
X-Received: by 2002:a05:6a00:999:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84e931595b6mr4900316b3a.20.1785288802849;
        Tue, 28 Jul 2026 18:33:22 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3f16sm582845b3a.59.2026.07.28.18.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:33:22 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:33:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: kr494167@gmail.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: stavinsky@gmail.com, chen.wang@linux.dev, inochiama@gmail.com, 
	linux-sound@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sophgo: return 1 on volume change in
 cv1800b_adc_volume_set()
Message-ID: <amlX65QfQGty0E-q@inochi.infowork>
References: <20260727053804.25599-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727053804.25599-1-kr494167@gmail.com>

On Mon, Jul 27, 2026 at 11:08:04AM +0530, kr494167@gmail.com wrote:
> From: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> cv1800b_adc_volume_set() serves as the .put callback for the "Internal
> I2S Capture Volume" control.
> 
> ALSA mixer control callbacks must return 1 when the register value is
> modified, 0 if unchanged, or a negative error code on failure. Returning
> 0 unconditionally causes ALSA core to assume the value was unchanged,
> suppressing SNDRV_CTL_EVENT_MASK_VALUE change notifications to userspace
> sound servers (e.g. PipeWire/PulseAudio).
> 
> Fix this by comparing the new register value with the existing register
> value. If unchanged, return 0; otherwise, write the updated value and
> return 1.
> 
> Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
> ---

LGTM

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

>  sound/soc/sophgo/cv1800b-sound-adc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv1800b-sound-adc.c
> index b66761156b99..bd93e261bdd1 100644
> --- a/sound/soc/sophgo/cv1800b-sound-adc.c
> +++ b/sound/soc/sophgo/cv1800b-sound-adc.c
> @@ -251,16 +251,22 @@ static int cv1800b_adc_volume_set(struct snd_kcontrol *kcontrol,
>  
>  	u32 v_left = clamp_t(u32, ucontrol->value.integer.value[0], 0, 24);
>  	u32 v_right = clamp_t(u32, ucontrol->value.integer.value[1], 0, 24);
> -	u32 val;
> +	u32 val, old_val;
>  
>  	val = readl(priv->regs + CV1800B_RXADC_ANA0);
> +	old_val = val;
> +
>  	val = u32_replace_bits(val, cv1800b_gains[v_left],
>  			       REG_COMB_LEFT_VOLUME);
>  	val = u32_replace_bits(val, cv1800b_gains[v_right],
>  			       REG_COMB_RIGHT_VOLUME);
> +
> +	if (val == old_val)
> +		return 0;
> +
>  	writel(val, priv->regs + CV1800B_RXADC_ANA0);
>  
> -	return 0;
> +	return 1;
>  }
>  
>  static DECLARE_TLV_DB_SCALE(cv1800b_volume_tlv, 0, 200, 0);
> -- 
> 2.55.0
> 
