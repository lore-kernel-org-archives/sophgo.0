Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD321E086
	for <sophgo@lists.linux.dev>; Fri, 25 Apr 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745621201; cv=none; b=fAyZ8NOWNlLWF9ymKL0pK5kF58Z50NywSZueLXdDR8FDDpVyhjinthmbSWhjfyix8lAr+KU3ssqWPxiuVQLkzSgMxKa19mdWzw1hkw28K+NVSjZb6aytUvkFiqLQq9Q5pOa/S+eMjH6mC7+34nR2BjizNUAJf1LRpMrAX5HZ/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745621201; c=relaxed/simple;
	bh=mqrro+vxZhjTZLSg80tSis2wub+LIUloe3g0FjU34k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VEexe7Q8YECS6GLcbxfWZHp0nwGlwyN5xcqj0FJc1qexSXg8TW+i5eEB3whjj6WAeJZYdlDQwVBZvoU8pPRQJ1yMgtmGl6+HkjWFT9qnA9Qy8Gx1NN8ZqdmgHCV3pcFWVOc+ZNWu2fKTKySnBYfU90hcBzy+pfie5IQ4ylBJIoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9AGuCHy; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9AGuCHy"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476b89782c3so33999991cf.1
        for <sophgo@lists.linux.dev>; Fri, 25 Apr 2025 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745621199; x=1746225999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ts2LHLz4I7Y52dAaMUvDVUrX5c5MFwWvzizIevoXa8=;
        b=Y9AGuCHykV4cvUmaPTafD1F6hflJdUEyKAkoWPofL9pWY8iPP9/9a8IhE/u72Oq0eX
         I1uvEP+izG302lHnr2viJNEyeRcXwyVF1NscrkG/NVEd7kOKEl65KbMJo8s7xmp7NSSx
         EbIaIVmcu9GIs5VMIfmiv1uOwkWvx4DjSBHxqKAdgreyyTBe2rj626bhxeUs79YkkCKo
         H/QgJ7/BYxOzvG2m/Ow/WRbJdHCHfseoTuruAlwrwVqcoy8nexLHdbfzdrnXQnaynYzp
         8ZiYGAGAFo6UTbQ6cw7Zcc/RPcT1wMWjb2jEDM4DEmizACY3d/yo8jxMszCRyVwoOh++
         w+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745621199; x=1746225999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ts2LHLz4I7Y52dAaMUvDVUrX5c5MFwWvzizIevoXa8=;
        b=kwcBpZp1o+nDJ2hNAzq0SZME3kKvHxvktMe8mq7myKGdh6wMB/a8LhHl1zyNMjsoO6
         dq4y6za+PZ51QYRrVvkE+Vc+CV7496u5hko8DfDZuoi6Hjf0h0aDyvaEzykJWAkMR2Bs
         qVSGJSApA0uv0hejtC7kYo28APGDYEpDjdbTe1YzSq32191Y3DqE3Oy8LpJ1aFh2qIrj
         H7EhoxUbHoOC59zd+lDu0FRPdwtQY4+Mt+EIo3wvTGzGMPcYRVKK7/lV8JhSDgQx1yVV
         HVlfXyvid+SXXy6/MiKNXLeXkRLATF3yMbwSAwFCfI5dIlxyP+DSFnVql+9jWTxuRK4+
         H0cw==
X-Forwarded-Encrypted: i=1; AJvYcCUepq5nIFnerYbLaqnEF3apaO9mU2SMzrwZS7xjx9d5TUnySFc+BhVJsT1J0VmAmqJjQ0g7WMc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+786eCkfyztHHzmF6gP5Co6zpU/XzfV2aPM0h440K56Hw2FLe
	MzPpTafO91tgju9+IxgVLkun6l3a2a0aFNXr3vbB+R4wLSTeZwBc
X-Gm-Gg: ASbGncu9xE9GMiNi2ASuQ4mKx08c28RInfAq+/xO0l7oALGecDrlnuAddgSADQNN3pp
	88Jr5H60tJe7g2I94OTldJBDY/ibA7gw349/02bBNvbUSdjwcbDv5CWnTuJpSAKh5y//Dk4O3Sh
	ewCF+26K+juvY1UEQWxDfsbeMYVCXM+BIYfzpZH+GazrLxza3+ud5wJz5lrhBPzVHWDb9GHzhS8
	pOY6LnBMPQv2yLPGC3I+bjil0vCiFcunDpsO4sj3qxia4qM98VxU54sKQdY7tvi2yoWeA9JrXBc
	p6lrZ90Fvfy6BMCm
X-Google-Smtp-Source: AGHT+IHFMnb3Dv8ueG3yqBlwgHCe8l9Ust4EP/2O6HiGpIC9Wsr8B1BoBXzzFa/o+yntyw1+DEItgA==
X-Received: by 2002:a05:622a:44:b0:476:653d:5aea with SMTP id d75a77b69052e-48022c311f2mr71095971cf.4.1745621198814;
        Fri, 25 Apr 2025 15:46:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9f7aade9sm31608541cf.40.2025.04.25.15.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 15:46:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	dlan@gentoo.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/3] Add basic SPI support for SOPHGO SG2042 SoC
Date: Sat, 26 Apr 2025 06:46:24 +0800
Message-ID: <174562116075.44155.16153568743582416091.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 25 Apr 2025 10:28:11 +0800, Zixian Zeng wrote:
> Implemented basic SPI support for SG2042 SoC[1] using
> the upstreamed Synopsys DW-SPI IP.
> 
> The way of testing can be found here [2].
> 
> 

Applied to for-next, thanks!

[3/3] riscv: sophgo: dts: Add spi controller for SG2042
      https://github.com/sophgo/linux/commit/ae246f5c0ce444e5c964aa3a7d2d14a6df9153d6

Thanks,
Inochi

