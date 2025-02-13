Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA28227E84
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739446411; cv=none; b=tGBbrfPZi8bbeD2v1oQNCi8rVeC5KXIpyBBIhA0ZeZ1cdjKlgIOBjgjcGXRpmY8ya3VjZYimvzRu2DJF0iHMODvNIBhaa+VaYS3+IXJd0ca6vFhP33zwMNDXMCgN4opY32bw2a7Wv3x15OdEmmUQ0XZRO+xbAic4F9l3lxgwJBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739446411; c=relaxed/simple;
	bh=p/0qg44bstO5WNnUfr82eA5sFdyx00TkPp8MmL37jE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXZPXfz4uxBJgMDbpSet67p/u7gDIi6jKVfSnU4s4iTaUwPF2/Twqg0KWvUqWlKC+uE5aXjbQLoIUO17NEttpjlvaKNqA2Scn/kyTSoIOfGCkeOn5zaWjnoaUHV6ZY5J5TJLkVD+IgnQRpApPnuX56efK4qXPMlsLFiNSxRd0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBK+PZ69; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBK+PZ69"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c07b65efeeso50270085a.2
        for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 03:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739446408; x=1740051208; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCjzjrsnGB8UX9TppDQ1Fq6klVuQu117zKu3PlITgVk=;
        b=DBK+PZ69ghbmgjaAkj1U2m5Z84X6xbO9azt9W+X9x8QyzpCfTTn6E3w42fRqcKzQYk
         ZWIG/AJLt80gPUwIJnsU8YJLKSCfAAx+s7KxMYg++0d4jkiVD3elO7Z11V/idDyMKQoV
         jCq4RhRgN0/euEKWvaQzTUQXfkyXqMMW98oVpsIldGlC8qLC2ehp6xwBJnxpcSHVFDY4
         f+XNXqIzhC1brlYHACam/aWPBJuiLYbS4Bs8UztjHzO6EF42Re9kwPfpo+gWsuS2679a
         AkD0dyVFg55zZ9a/EGPn6EEqQAqan5IrdZ/wPGB16vZstDeEAoQ5rNTCTjDJywF6ATgn
         pcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739446408; x=1740051208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCjzjrsnGB8UX9TppDQ1Fq6klVuQu117zKu3PlITgVk=;
        b=ZR68phHOy/h2SNvWKsBy/IeE755JNubNokuoZpG79qAD22csPVOMGOB843H5bkMMMM
         dRtBjXptdfaHit8rMsInV5geqOKErT0p3uz8cR71eZK4f5WIY9RkrGDSRLjWEeWGVAUA
         EFNkqKuMqJ8A+iuZMzDLMTuiYG5aNsfDeRrWpQxCydUSc3kC6jZ+zP/yM6OmjYyvDJIW
         iE/BB0tSd5zU4Oxzvr9j3l2lJFdeCV3EK9spEuBqDJE9VmjQO0JQ3zfMAN0f5xWEaC94
         RkpyhqRGDOMdN/QCWk1ZrGzbCemenyxb2HYXH0K77+CUzEYc4Lsl0SjZdUlfjB2cSCuW
         j0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW9UYJHm536p05vKNgGxMHFvGVYjaN4V8avCL88RJ1qxlDZRB3phiTKkAUTYi7GjVjqLR/NSLI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3ZwuC+Sm6GvAMQ3NMlEKyXBFK6bhIr8rnu57iB+rvP5kd8mTY
	K89GQGp+J54QergUV0PXOh23c1bHBg12xpbcxSI/FpDaDEJ/HAXO
X-Gm-Gg: ASbGncvHfN3YxC5T5ZJNa6EkUs0AQzQVfa3G50U6xwMxeXEkIU/LfhEeIUCvUCn967y
	xr6nFrniUWD04KBkrxDfVCqwXHk4g6VQM5TaGe0c2n3byM8Z9/quVMr5y/v2pYgV97XnEXZKzDy
	3ca+zArQEb8tqZu5mHDxa3v8oUoCE1aQYoN8PUC2clPfGQ7eqYXarqYTUD5cT+qk44LzW/8OMWo
	ioLpwCqMDrwoV+eNegR0AmuGvKO2RbyRPdiTQesxYjTaY8mL59fGrEYHPC4k6C3dcM=
X-Google-Smtp-Source: AGHT+IFXo9NdWsRyyruApIs1cjKDwDnPHq25hEtzH65MpQ5viX9oTBCdwL1YIhjUn707bQRGVi/hdQ==
X-Received: by 2002:a05:620a:3c92:b0:7c0:7a75:4fc8 with SMTP id af79cd13be357-7c07a75526cmr310011285a.24.1739446408565;
        Thu, 13 Feb 2025 03:33:28 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c8611e1sm74722385a.81.2025.02.13.03.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:33:28 -0800 (PST)
Date: Thu, 13 Feb 2025 19:33:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/4] reset: introduct generic bit reset controller
Message-ID: <yfhta3vfct73udltmz6ri2dsas6wx4g6hww3drdcumreqbi4gu@c6zxqz7fbh7j>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <42e8f0e0f065b10fa8731d26acc856e5776fe2de.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42e8f0e0f065b10fa8731d26acc856e5776fe2de.camel@pengutronix.de>

On Thu, Feb 13, 2025 at 11:08:03AM +0100, Philipp Zabel wrote:
> On Do, 2025-02-13 at 10:08 +0800, Inochi Amaoto wrote:
> > Many SoC have a simple reset controller with toggling bit to perform
> > assert/deassert. It is annoyed to add compatiable for each device when
> > coming a new SoC. It is necessary to introduct a generic device to
> > simplify these things.
> 
> You'll still have to add a compatible to reset-simple.yaml for each new
> SoC, see patch 3.
> 
> regards
> Philipp

Yeah, the binding is can not avoided, but it can avoided adding new
compatible in the driver. I will update the description.

Regards,
Inochi
