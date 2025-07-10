Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F60219A6B
	for <sophgo@lists.linux.dev>; Thu, 10 Jul 2025 04:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752123028; cv=none; b=Xvb0wLFCBl1Fvh/2qlBZmZjT1jjqIUSzFxFP6JLfCwH+8gmH2LRd65CXsO0Le4SM1Ycr3pVxBErC/i9LFwYiBCnInXfSwoQrrIFAJRBGu2ns5K5jDxNNeHujvha7/W18o7ruzx3Kj+5FwLI3NwjHJZN3vNW4hSkyrBM19OoHFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752123028; c=relaxed/simple;
	bh=uwp0gpqeQVbZO+U9DueXgLMbm96HNfkTb66F33+MUVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgOYRzH1l3lVf8l5w2Oi3EhfcdkInsSFEmAh85IHEqrsE+wxwrKtzcpG+qCc6ki9U8LG5EC0wb/bs/R95qR3rNSDkS6FxF6lEggHLGPOgfrGirfP/wdVa48x88NVXsC+F05G2SiDz2We821//Q4wWTdoNhXoG4WSyzg79lrrc/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJLpD9mi; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJLpD9mi"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73972a54919so542834b3a.3
        for <sophgo@lists.linux.dev>; Wed, 09 Jul 2025 21:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123026; x=1752727826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7N/n4V1gD63xC4EXHv4+dlIpkFn7EZuSphI0w630ag=;
        b=eJLpD9miu1hNhl6xqRSkBp3CUOr0Ot5wirW5VYEgW4t2Q9ZHv37n+jCrJW+GaYY3lv
         ypTlllqyAvuGMboxnHsqJVizAWHkGYwwxxeDO8pAVVJXKM6CbzUgIlf2pmBYAH4BlhLZ
         NwfF2rjOSNOcjv1ctqKNaq8FFYzvFvMO2UfhCmFtNxQZF7uICu3Rme4a3KHBvcfLP6lI
         PCos7PVKPs/JKLiyNN645e6F+RiYUJq09JlSjwU/yzyziwoxUzPcQv3ass+5T24rBU3g
         Fbt03VRCtjovQvX8aOEhFdywzvX/QUM1BgvWwkDR0fUL+CoE36tf17iG0wEzVahRZ56F
         D6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123026; x=1752727826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7N/n4V1gD63xC4EXHv4+dlIpkFn7EZuSphI0w630ag=;
        b=OkSRjmxSTqPSRuT7qJ1gDWpvUk9FhNssONTqwWqpVU3jaV9UEyPg9v9CC9lN+wn+pm
         FGctUWgNm1719Zq1+HCzbB3Mo2c8i/D2Uzdnau6AZT6/ZWgyxU/sVJSEdc2KpeOfxgTG
         oNOMdK9km8lkt03cscKlR2r5yS9ySkA5hdpSPXzc5qQblnTVQJLAgSrCTqAFcLBm2K4o
         7W2DNIIkXBiurS9mTnVV11y09WzL0MBcMECM1Wra79iZw4F1QLSkHwNlmHs0pifLJrVS
         MwOFaNOnbhaIzW+4z4huXPSSrSppS2Xnu0/gnH5lr+zWxt32BYWf4/r2Vm3YFUk0Qx4o
         EVJw==
X-Forwarded-Encrypted: i=1; AJvYcCWvSrsOv02qN4EBglbw7VHtLs0k6l0Su4Uvqkco4dgDJlXBV9B12D8VMbH9rdZvRbc/jXIxGTg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1eEIxWlAGuSa+TsY4yWldZAQLahUSB899fToVpZrOnlPgeV8l
	HoEmeCS3Sjo2oUOz6UlJ3dQYPi4bakk7wldTagtNWeJ1g6ylm/CI1l+a
X-Gm-Gg: ASbGncvz7nI73jAS1pfYojbOMsFNkf/QM7/MTwdF08SVCJB+hVtsf8jaK1rHoZjgLzT
	pt5T6QAg5/aBH0Aw4vaZLtvWRT6T68SSwMZOn+GcF9OYkeU0jnon45J72nsUXOCIY+JRNpOZmdb
	AKfDFP6R/FdWVo0H0xpRiVE2YH7nKxpaG2FPAWr624oxpdKCVqG4ulizsMfkm6T7gkAsw1vM6+R
	/Ubv73S37MpTz+lrZ7Ug63EG2LQuS6SAQrSEULNsZlbngDZL+bFUQBU0XDOslTnq5M8IONyvP7L
	oDFyqDUAWIlr2lypTQ32xy+//D8r03GTToPgvuUJh8vTfnWk5b8DIJlWndiyTg==
X-Google-Smtp-Source: AGHT+IHuOp25kVX40AKI+YI7J3pVcWxjA+P2rjstauIuq/UhiYjgiNwjgAfEnySBXpD5cfDnLEReYQ==
X-Received: by 2002:a05:6a00:2d06:b0:748:f854:b765 with SMTP id d2e1a72fcca58-74eb8e84e50mr1962266b3a.4.1752123026300;
        Wed, 09 Jul 2025 21:50:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9e069a1sm850099b3a.46.2025.07.09.21.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:50:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add pmu configuration
Date: Thu, 10 Jul 2025 12:49:45 +0800
Message-ID: <175212292373.416883.8963674402175536459.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703003844.84617-1-inochiama@gmail.com>
References: <20250703003844.84617-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Jul 2025 08:38:43 +0800, Inochi Amaoto wrote:
> Add PMU configuration for the cpu of sg2044, which is the V2
> version of C920.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sg2044: add pmu configuration
      https://github.com/sophgo/linux/commit/111ecba7b1f884133c53847558a8595294dc002f

Thanks,
Inochi

