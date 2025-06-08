Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3CE3D81
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749423045; cv=none; b=XhNW0/wb6TpZPp8/XwXLRd6yrpJ8SxuZjvGKZgskzS3eOTf8iWeg06U50tt1ARlTCyElJppri99DIRe2Nd5CRl0esb7bv8o+aKcFed0Guy4t3OOGb//5M8JZCMkc3HxfAnYKk6u2TSMt3SwcKQTo35uZIQUbXJh2tzxYfITiHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749423045; c=relaxed/simple;
	bh=WA48rYTHajKvL/v+o1GDONAug3SMZ9Szm2cVeOrNvzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhNxIhtYMG/N8OqlCneRalr5oVdPNR0rwf8/tkrOqYSKkyfLLdA6yctdKqhvCPdK2vLtHmZ9WhfyhoBfRPPkfzgd9+d03ltsXB9TBX75v8jMrnFYQK60yTNG42W7e5BkUpXOHitbGXoy8aPPLQ7x8xqkU2gHrseCMThBmC2E1ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISR0DpXO; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISR0DpXO"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so40793146d6.0
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749423043; x=1750027843; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EqDgz0NCcZN9QC0253LFQnVVu6/oAnqnobzuB0mHNx0=;
        b=ISR0DpXOH5nMbteImAuC/+XOK7xU+5DS2Nt+gIsShchSbVq4sxoxrfLrD/vkwKwNOd
         wAb1ZRI426EECtZRWvK+PmmYQG7PK/tgdRiWZUzWi88DyyjXa8PiGT6UK3xGvhbrbmGn
         ADAKzRs+HzGfBZ2pJ5BppzuRZ7nBw/Q1yQhmkASSjC5hFCvXdpm2Wb/lX2548gdCuAPt
         T9kdrKAVDLF7MjmLJ8zHlszW/i3CiblMB5e3lAmOp8XilzMfDrGNqvBLYsh57opCHzBf
         GATmsfRRWbQ71Cl4c8QuXO1OjgEq//oi6II1KXFSoosxFyE0xcjSeuIHO6sW7ev6Gbpk
         TlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749423043; x=1750027843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqDgz0NCcZN9QC0253LFQnVVu6/oAnqnobzuB0mHNx0=;
        b=mm5PTMzRvR2FmRtNoRqTVnOm+HqGZeVVozMTneqg8WmR+9y7yMyReDhYgx8/ha7I54
         J2mHUSVMubPkeSOaSZR5MAbJYSkLpAI5CdvH81P03pSIRxthEj3rK3PqKEhSUKwPi0yP
         YFSgifrYVop69EJcLnZgkZiQeSkxW8vbS3yQmImu6J00S5mSXty+9P1r2UrEqyrz/K6U
         b4MmDszhTIdz4v4e3HVJBqo5pI63UFcCapTbV+4EiOZBLFkPkH3/PCy5exSJF6k/xXka
         9X8UDFJehGMSIGWOJ/tRieW/FmwbjiTYj/YMApRCSD3sM3nD8z1Xcnut/13fj/riUTX+
         OgSw==
X-Forwarded-Encrypted: i=1; AJvYcCUZrHWcMK/LWKmUcDODrgzfeo9HGgj3xG9Y/IobqjJ+/Rrp0AWYfWsOtQ/gnnqh5875/41xRxk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2aHHxyXP6GXeLQUFYYj5JHYR0oa6eDWxSeoYLNuAsjeOaRAB0
	BD0WzNiS6CwtkG7ZRILdaOplup+wm/wR/GOSG2wFyvkDuDbR8ew/LY5Q
X-Gm-Gg: ASbGncsAVQh52W76c1eFvS8bo1G9GVjNqQrIs/ywX2N4lFb/uPnFERQoBtxz36/C3Xz
	bsVDV1C2pG8+bOFtcjmlU33gMTX/H1gwZILVYgrUWSJaQWEvswQWys4MYwySd1UQA2HQW7ORIFa
	SpL6H2v62yTjcIr/hOTufoz/jivWmFdnU+T280NpBKsAir8UKMZ1GH34dmjNG9b1ek+JRf2NR/D
	K/B8dnDJ1QxG/HDicf5RLKI3aFzvFgvOZAroW6eCumvL/FAmISVo7a/wq982xqLPN6EOs5sdV9+
	oPlmsKpDO9PwuNmAeG1ZCCb3QlaIWLhf7wRhIA==
X-Google-Smtp-Source: AGHT+IGShP7EvG1pOezpXTDRng7WHyQP/iIeqU3gPsNBUfzfAa+p9z332xR/0u2mhjLf3j/kbENbew==
X-Received: by 2002:a05:6214:f0d:b0:6e6:6c7f:1116 with SMTP id 6a1803df08f44-6fb08f82f25mr160146206d6.24.1749423043070;
        Sun, 08 Jun 2025 15:50:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09a0e8d7sm43952456d6.0.2025.06.08.15.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 15:50:42 -0700 (PDT)
Date: Mon, 9 Jun 2025 06:49:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <ywln42bb3i5hyzlsmfbx3xt2kjbefqmcxytcqxdcgah77gcesi@2cdw3cgxbg4c>
References: <20250608224252.3902421-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608224252.3902421-1-robh@kernel.org>

On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> path 'soc'. However, the correct place for RTC bindings (even if it's
> also a "syscon") is the rtc directory, so move the binding there while
> fixing the $id value.
> 
> Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
> 
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> similarity index 96%
> rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> index 5cf186c396c9..c695d2ff9fcc 100644
> --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
> +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Real Time Clock of the Sophgo CV1800 SoC
> -- 
> 2.47.2
> 

As the rtc syscon has a sub function for remoteproc, is it proper to
move this binding into rtc subsystem?

Regards,
Inochi
