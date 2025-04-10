Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5EC1BD9C1
	for <sophgo@lists.linux.dev>; Thu, 10 Apr 2025 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263919; cv=none; b=SCDYcZvxJYnyxB0K94zfkUBSi9J0CpQk1yotzzFLde3X/5tZsVI+LLMeU+BushcuYCMsfD/9RHHY+73Lx7uIkoVN8JZ9qyFGfvWwY4ne7gBCUEzl2R0ZoxHS0/hZugWQDRoU/hFvDaA1tvYo8p/1YZiny9GJqNnCtDsPM+n/YvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263919; c=relaxed/simple;
	bh=hyhQWbvvY6aZDWGecgECnU2XiZensqO8oW8ktfacXz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0BSfaMn8C72+PVZXTo5F9zZgx+JfnE2Y7clrIIJ0XAK2PAqnk+Aphe/nwrecLvVhd3wNtommRm9xCEc/3UYFwMmx/IlCP5wqVBEge+yUkW+qVWPQXZaHwGuwUYYNx7VojJ7i20SwOQhA1abPT2KqnBgcp6eCLeOCCKbN8rmda4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alvtxkIN; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alvtxkIN"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5c815f8efso44507285a.2
        for <sophgo@lists.linux.dev>; Wed, 09 Apr 2025 22:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744263917; x=1744868717; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QnBvkHnjo38Z4sQgkh/340/KUHasIb+bKgEKZsCRewM=;
        b=alvtxkIN2XgHMzwm2ufh0zwJX7IvAM5aFXnHVtxH5KC0lNb4LLLA6RAx0hFQiwQmSm
         Unw7QBPgTqdc+OQCmWPs1TEbAioXF9wv/aqK+zWqYlnM5V+Ho6OY+4uhk1Vi+M97cwYF
         aaLCKrJ3BCHABrhprCgEvt/28mY79dFe2aP2uXbDG9C9jylx5Xh73gxi2IkP0vp200/H
         Neg2vPC6uo+OU6JR7w/6EzKq75ip/rIPjzQh2lK5e2+/wlgfMEObOSyuRx/Upw/5w+ao
         TaNFtbYMbYKmyzmkCjZJ4qifavZXVKaBt0pb2HrA4elnIwAlQ4yQgdOULDNy86/LYqQ3
         UKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744263917; x=1744868717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnBvkHnjo38Z4sQgkh/340/KUHasIb+bKgEKZsCRewM=;
        b=MbuMgqFQ8EP1IZJu4oc4hvOamzy0odGMt9oUcgWDYabiYCX768pp9+zpIZN94mSc7z
         iz4ktDbY7GBmTSNpzXoOItXU+jP/6v3dolLLhz7Ar7VtupeYZIAX5dpSTOnAQNjXPEdy
         +10EHkE0H7pJwMcaT6HXB7+WbL+CWB438eJFYQtzrinHbolaxv0+/v8LO5VwnQN6pnDG
         2ZY3BwkgzFRQ1QPM00tiQNgZBOhl6VJsZPgose34HrdiuSYxGwUKWMtxn1lzsd3/Zms8
         405UpFYS2Jebl/LQkiUuCUX4rR/xmsgSjFyZWhtJly2W7nhe9jKYVww3frZM8pRvRRZm
         tdUA==
X-Forwarded-Encrypted: i=1; AJvYcCW3lEGZbyqFh9UFa9cCd033GMj4takj6Zm9o3y0hFisIBwlZxp/BxAuQYPETGl19JOw0cKq1xw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlm/qCly2QmgHlbudUiZFlMYdSUl2NP5pxq9mv6xOeOMo2XcTl
	jgVsSIA7mWJGAQfgdyohAlxlu6Kz+RimGZfBMbsn2mTOjlzzceWp
X-Gm-Gg: ASbGncuzhT55u/tW79tDGmKQTJGDl8iNSeaO9x7+DEkNgNeE1qu4hzp4c3ipmg8itBS
	8bwWQ5MTzgkMgkd5QLgwKi0VWdDlF0sOq9jNdXsYHRluhFwLRQQ4QQm17LgSzeSZAo40s5wvXNS
	4pTiH4XreKWjOqC/+VH7QRfp3A5B0k1xCRRwgHedGLrK2briBf1munUy2Ue4TCaiZCsJKpML3/e
	m128vNOim78Nf7BN6u9W9luJsLYNS0mzTyWhKcR/dmcmYmRAq/xPKVBr6aBkNKdxMkJMTlrKq2d
	RuO683MqW4+uW6+af+YOk5lsACc=
X-Google-Smtp-Source: AGHT+IHNoZEz5x3zmUQjybBNrxVpd4osnT2kTmBT1dz8XQJi1JxSOi4Yd2pHHUYeeBMJWuCz+52zyw==
X-Received: by 2002:a05:620a:4154:b0:7c5:a424:1f67 with SMTP id af79cd13be357-7c7a816d0f6mr119973585a.29.1744263916967;
        Wed, 09 Apr 2025 22:45:16 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8a106easm38536485a.113.2025.04.09.22.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:45:16 -0700 (PDT)
Date: Thu, 10 Apr 2025 13:44:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	sophgo@lists.linux.dev, devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <aczljpyu56po7xkhqjjelatfw5l6bpqskvd3jnl4muy4pt3rjj@5q6imbmcqng2>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
 <20250315224921.3627852-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315224921.3627852-3-alexander.sverdlin@gmail.com>

On Sat, Mar 15, 2025 at 11:49:13PM +0100, Alexander Sverdlin wrote:
> Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> machine to control chip power-on, power-off and reset. Furthermore, the
> 8051 subsystem is located within RTCSYS including associated SRAM block.
> 
> This patch only populates RTC sub-device.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v14:
> - Dropped MAINTAINERS F: entry in favour of the existing N: entry
> - mfd_cell name "cv1800-rtc" -> "cv1800b-rtc"
> - Removed Cvitek brand from Kconfig
> - Not built by default if COMPILE_TEST
> v13:
> - Moved the driver from MFD into SOC subsystem
> - Dropped unused "cv1800_rtcsys_rtc_subdev"
> v12:
> - new patch
> 
>  drivers/soc/Kconfig                |  1 +
>  drivers/soc/Makefile               |  1 +
>  drivers/soc/sophgo/Kconfig         | 23 ++++++++++++
>  drivers/soc/sophgo/Makefile        |  3 ++
>  drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
>  6 files changed, 93 insertions(+)
>  create mode 100644 drivers/soc/sophgo/Kconfig
>  create mode 100644 drivers/soc/sophgo/Makefile
>  create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
> 

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
