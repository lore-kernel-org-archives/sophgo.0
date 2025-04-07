Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66D686355
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988178; cv=none; b=UW3TkOglRk3q8oWXjY+7mOHg5Ut9bQ3hoz8dt8PUVjdUmIHYMSvHvXktznIeg7WaYhqLr8yh1AgaexW8T7trgnVgz5e1sXXoE6jnjBwjtZyo69gGG0cdJF0XoadRTcR2si/FIbCimwqncRG6W3tno5KMpcQ1ChK8tRHjf5g/v/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988178; c=relaxed/simple;
	bh=qFpJkpO6DX3BTQg+eiAtTfhhkQ3s3RXSaTPwP48oVPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZIYO7Fqe4143OO8fxq5tDoFFkc34SGbmWOS3EFvloLAmrn8Y7cW0k5wQu+reUf8zcotLk5go1DPPGsa2z83ZJxvEfBkkTwKipSk4QqsIo5u8O/9PsyRm3XqYF/zFGp/LSDfmdArDREsCxiw3XF9pd23cvKyAzvkTtcJsSOOVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mz+8z4zg; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mz+8z4zg"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4769bbc21b0so35039281cf.2
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988176; x=1744592976; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTaxpP+0BisXpBWkHEPT5jUCMTocLUlCjk3pVjz+dsA=;
        b=mz+8z4zgddPrmteSJ3kTPJH2xqIJzJiqUYWZBUXahjViK1Iha2q4nV7Gc7bHTUXmg3
         n64zNp/pNbfCxdMln1f5ygsozaTCKpdsZe0vrEUm1ztcZ2vMBp1T28r+WerTUChiclm2
         5z3jZpLHPNx0O1tL3bzBLuVX+7BgZOxQCdhAngPrtLsPOFz1F1gFIYtiIHBF6hwIDwvZ
         9f+ic6MD1FdDAL4aDY5r7wdLf149EX0NHWZNsfHXUtIwB4Nd+0DEyOp9LNRtiQL0KYaj
         vIjEIHHZcIkobC0sPjBxaLShpssetOVDsWHtjnnra7JiBHZwzH/Jo8ksffcfbozq8OXk
         4n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988176; x=1744592976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTaxpP+0BisXpBWkHEPT5jUCMTocLUlCjk3pVjz+dsA=;
        b=DK+0G7xIUTx+kZDYobSuqPIzSTCn8k/SHxGnUd1LoyhqYaUmDPZozBeIRtk5XwrhVv
         6lO1phbTzm+jZg3HM8cPArsVOl/riMzXsjHMWuBV6OM/UxOCrUAweU0MJPgNMQ15081z
         9IbQtM96Az6NxJ9Zb3JpdJ2ChucK9llBSua11F1IPdprJm/0FsPiozjyj34ao38ekYvO
         wHULdpHOHYxJFnfxUA2Uwlmsc7K+F3h8fDgZHvvmfmu3147w+qYU/PJhu4cm0gaOQ7M3
         oQtmd2uIWHwZMZMz3jtCDC28mUGODw5XqN1v0R7HCR5BDHtZ53YEBNUiuvO7fDXIQv95
         D+XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKKwH0Ss2ecRfT31GOtux8oBmEDThD7fsoQssR9UvwxyFPkZ84TqJM4nMXxwH8kQ8KFzXlDt0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSNULCaQA06AFQyOtSFifqPsSSUDJtQOKfTuV2l+9pE9S2Ia8x
	hB+tetrn+slTN1HN1etbncy6T5CqmPq7JtRoG/0WkIbGM/C3kOEb
X-Gm-Gg: ASbGncv542i9NLM+Eq+DwftSVeSxgi7IUMdYRZPVWoUpBz+tvS5G//948Hq+A1av7BZ
	ZchIVdy6SsESScbwyyqVc8flLb0jdjZydHw2Nkad5mg/vGv44k1c8mIGvFYWQR9phVRQOf0Og1N
	O6EYnr8nv0XiBNtiFS5j/GDn++bKNSll6hmQP+AqfUwrm0Vx95wO/pZf40JBKEkxMvik+FuTKgV
	JL64vLAxS4rdECk54emXF0PlithqulzTKJesjnqud2NCl5KyKG8Qq1nvNjHUqf9MmcjiQCULxGB
	IwqTRWwdTIhx9heUptjr
X-Google-Smtp-Source: AGHT+IEmKlIM4zH7lzG9UIKklSuD+qJQ6td8rm/OkZNC5rmvxg8J4PmWcLtB3/5GZa2BN0aYjGS/Gg==
X-Received: by 2002:a05:622a:180a:b0:476:80ce:a61f with SMTP id d75a77b69052e-479310eacfcmr110677731cf.39.1743988175814;
        Sun, 06 Apr 2025 18:09:35 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b1444d2sm53175581cf.76.2025.04.06.18.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:09:35 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:09:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
Message-ID: <vxjtdvy5vxhmqldgvt4mgeuor36gdjriiai7y3rej3tevuwisa@wpupxzhvc3tt>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309202629.3516822-2-alexander.sverdlin@gmail.com>

On Sun, Mar 09, 2025 at 09:26:23PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> called RTC, but contains control registers of other HW blocks in its
> address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
> 

I think this is a mfd device, so why not moving this into mfd subsystem?

Regards,
Inochi
