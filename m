Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61325285049
	for <sophgo@lists.linux.dev>; Thu, 10 Jul 2025 04:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752123033; cv=none; b=RNWPTeBkfba7QWHfYKAb4JKzOmSNdfAO+UVMuFwirF6NbBD/qrBgG/ItZBv6Ga7tAJJ296DRJGINkrepMx3J0H1kdA5C9IdwyElXZyQ8NA0muidtJ6/0BrUgx852o8h63w/fy7ZrEtvj7R6x1oqkSxCmThqzPYHhHtDvpqAQWmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752123033; c=relaxed/simple;
	bh=r/vFoFPcxhaEHAosF1butA9ZXZJWUZ0og7tQJmHe1Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=blVhpzpRP1n6YeqZlXdA+poD8ySGy61RgaoEyhfqg3rf6RZ8S7wAQWjkUACc8JolusUX3tDHXAyID1GY/3WqfzDzSHCtS0hGFGsZocv8ESFxdhGUpt3kfZKt+gYPBs8Kd1OR2yEfcoy9IMeR8S69Dd0HhjIfB9SqYhwogugiXiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtqPPXfs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtqPPXfs"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23649faf69fso5038395ad.0
        for <sophgo@lists.linux.dev>; Wed, 09 Jul 2025 21:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123031; x=1752727831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGHzgNL4+vgpSA0H+m9gA8FMtg3Ii9xrQRTg+31D7LY=;
        b=GtqPPXfstLfNBExPg/E7l81nbrx2V2UfJ8zoepAJcvNGH0jb+MHHk+sEig3gzqMRIe
         6QcPcKJ7DPQN1l8orBvPIh3h4/Zx+vI/FNw2bCJolEsxBpI6ChujyFliMcjVEt1BAiPw
         4DoHkuPnWVAjdG53gIGgT11kvTRU5571HubNuJuwDhmMxKlE7d9ukGqxej+qmOnOJ2Pw
         MsqsXrJylBm0yKYeTKQMlezw/76O9dDgbOepZ4S3SPCdsOd81ULWJW0Lyo/o53xbDYm2
         vOMoXVfdeYbn4NIJzTiJhSPAQh4gbXR5+UbpQKDiDmHhBSelVPqu5cHl5ccI94LHDHiO
         cG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123031; x=1752727831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGHzgNL4+vgpSA0H+m9gA8FMtg3Ii9xrQRTg+31D7LY=;
        b=Hcz4hJHOKTtqq7BhUwK+sgmYT9kmOECkyRdjeJJU0qfCtdXSuPOFta1tVfQeSVMa8q
         mVLYVnpPHIsxLfCRf7zTZimFs/IVW3/ADuGaUUHgupfbEQxM0nyUVKMx0xNtIMwM8a6w
         g5OdMo5IcQxwCehx59x426J9SDjz63TTJqU4UyMS2ayA4Cj1msUe4NqZfHbFHBXVNrfr
         P/lOvI8NS5rLD4YURG22JN9fQVKmB1ay7Jzp//oM3fMu7AOjHHRfGHjp05BjvmfBSfyL
         Q71jSapsgfnGuLWcHqXqruBa/pwBrljj/UUAc8faIf6UHt0/lJFaak03sXwMC+QhBCIN
         pv6w==
X-Forwarded-Encrypted: i=1; AJvYcCUN2IznVD/lZRjlCV4tYJAQIvJAKlvAsrV9m3y/cdTWcsLesQ+8iWsgctQlsAjVR17Axck30jg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt7BrgEk0w1hgFb5uubkYGClgFlbhdgIZjH5+WJXEBjJpZ/9g5
	HHSiI9Hx5z3Uf8tLB23Blbo5DSoU6ycmEVFd41uzMPE5w/9plkn9rxNv
X-Gm-Gg: ASbGnctU8tRrqX0eOZ9afH0l0n9JYmJeHcmoGEmEKnOZBU8vfrWTukfMoYOQO59QyHJ
	YahCtZQCJ+f7tuJZA7La3YjFilM+pfhAthiIvJDPDhOObT4Jne6Jy2jcyd/WKoOJzERogczDxsR
	1ea4L27o08yUR2cpFUJmSb2WPWhBY5ii49xcQfq/7Qr+LtpC+n472ponD3e78elQuoKXm55m+NH
	3EZkvJYIY16MPR8SVuOnUFJ377589nRmgG04RxtbxSrnDJiGmzYy21Zzv9389s1cVPwBPqgU8AP
	xld0K3+IMe4s1IXN4wJeQA7mRwR7eduxfhKPLNQRxYb9uF5dMESC9qeWFNzP9g==
X-Google-Smtp-Source: AGHT+IHXOFRlJemTmjivVF6ysNCWCNLeYhGM/RjPG780mLaRyKh9lGj2s2LpZf9AP77JDjrcO+IkNw==
X-Received: by 2002:a17:903:3b85:b0:235:f70:fd44 with SMTP id d9443c01a7336-23de481bdefmr17144405ad.21.1752123031495;
        Wed, 09 Jul 2025 21:50:31 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de435c238sm8530655ad.234.2025.07.09.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:50:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add ziccrse extension
Date: Thu, 10 Jul 2025 12:49:46 +0800
Message-ID: <175212292372.416883.15637532130862457065.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
References: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 07 Jul 2025 11:15:18 +0800, Han Gao wrote:
> sg2044 support ziccrse extension.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sg2044: add ziccrse extension
      https://github.com/sophgo/linux/commit/b1d1810649b9d912c7990ff479a1c0f4c75610d9

Thanks,
Inochi

