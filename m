Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488C8632A
	for <sophgo@lists.linux.dev>; Thu, 26 Feb 2026 00:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772064946; cv=none; b=STKk6Bi58P6xhCc54lWmVdOzmJwa9VWbL/yLqbm7LlJ/OTu4SMPtd8Bz28BMQ6XeN3J/GDDABfqUik+bCPKsalXVIWGkQhp6KMoH6j/glF8igzh8sr9s6JcVd53UAEGdwSEApt0aoST2OvtjirJku28VXNENj2GDEUDJzQdG/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772064946; c=relaxed/simple;
	bh=bPNWxJ0PsKswuNugUux6ENRUt7NN3n0Zwy2e/5d8BA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mu3aIKXmirSlAEZHyKcHATKEbPMmZ0QhOUDL5Z3PG8tY0PnxZ2qRLN3FseA74ZHPODnnHd+muDPQhDt7bRGjqXlx/ERwtn0a3RIn9z7RmUaulJW6nqgkzP1LsY9U9ZLV5PFLhPMHHCynEs/Y1v+2+p+dQKqh1RokTCu2oDpjt7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dk7DjX3X; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dk7DjX3X"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94ac3958788so121105241.0
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772064944; x=1772669744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vrInnbX0KCc1ynABnNky7B7FYswXUG4HFiI8RLfvys=;
        b=Dk7DjX3XkrEc52K0A4tyR29jXX24os80WeahiQIbpnYftE5bC13uwFaD4EwssZYVd8
         yz2x1zikgkXsrW15oDsrSCklyeTvA2b0Q7zG0XX1+cpZe0S2mF6MhUbj3Tpg5HcG3SOc
         7dV9oJydIFmOAsHHA+JTbPHbPeOPw1U4+98X5O2rQbyWnOlUX0/JBE3xh9Ethir2UHeN
         QwCL77fteMs4p4/YKVsAprnjdr0+u5f/tDhsomFozQrUEchi5UWg/6MauP2bORNtDjO6
         OjYkeM3deVjUtPyzD8Gnn0/QIpyMxWxufwQH49Ix+dMWONW2U/y0oceVbNRqYlnXZGmH
         O0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772064944; x=1772669744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+vrInnbX0KCc1ynABnNky7B7FYswXUG4HFiI8RLfvys=;
        b=qpApBgy5Rksw03iANtvGk4QwVEXxiVIgCufiVJsCQSBYO3RAwj6yyMvmQeOuMvSUCh
         Wk5DJtkbiC86wS9jMro6/F2vjeHsEhDS+fNl583owpW7qn+WxfjNytl9sY+bYCCfV0bT
         7XLTyYiShgpt05xL/mH+zI/4t4u3GlV4AYNyUOpXpmIh5QkMF5faLoS4cQ7LD1/dkjiF
         D1tq06b5ESg7akEZnEdwClr29do9x3qpX5ywWoWE88EkLSQXSZA+oYFtmdixG/u71tUB
         xn3FLoNHppSaIW5jbyrRpFy3f3i4pDZSTXaJWFPm3/oTVbStDxL1mBExlV8Jl+KjNq4+
         073g==
X-Forwarded-Encrypted: i=1; AJvYcCUB2k35ipvL1BMp0smaVaQAVrZUcC7bTm38u9CY/7MJO55qYQcV88+agrP0hkAdPmyKgvu1304=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBoQVFV4FzZ2A3oY3pPvwK0bL/cs4BUg4JJQWZDYdCvrlW2aNe
	V8+ewmg4beGXfKbrrEf6j5dD2/Xm81DcLC49bpov7Wq6irCUtNX3s+evP1NQBrQ3
X-Gm-Gg: ATEYQzwF4v53ANFE7ZjLLbLCyWCV7uRVWgD7qqFbxx1DCmFwqzjbl9UyJhoam3i5li7
	jgBSywxuNoziuB6irnb4+eb1VJ3fbVL1+oRQSOzBlUw/lGOZY7o7Bmdm4CmlRvtm2m8JUMCqbxl
	wTGvODE/QU7nNnXL/Bv3zRk5nI+X0BhG8/9C/gEHHp+JBVd5j4V9J4F9EBl3BYy1ECYwql+aPHI
	iyx8d9P7f4y6SdzLGY99Ho+PURpnm4RQg+i0iOTfduFTTmBy76hmPahA9jRlLD0A/CVbK0CB77X
	CS9VJ+lKkQw8v0O0LbDiyNiLNMLIzMvZB1+MxT+cxqFsAQwysKgrsB9mcHekwrIfizqOP/xRLG/
	TSfvoBMeRKsbmFjE/JpAqRWHGfZigchpazHys/wVMaei5WbSY+QpAuhXEIGoNi6oCC1uyIIEIz1
	U=
X-Received: by 2002:a05:6a00:2d1d:b0:824:3ef6:a815 with SMTP id d2e1a72fcca58-82739767b3emr516796b3a.8.1772058091345;
        Wed, 25 Feb 2026 14:21:31 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d544ffsm290363b3a.12.2026.02.25.14.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:21:31 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Thu, 26 Feb 2026 06:21:07 +0800
Message-ID: <177205806122.119215.17895713731232514155.b4-ty@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 25 Feb 2026 18:40:38 +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> [...]

Applied to dt/riscv, thanks!

[3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
      https://github.com/sophgo/linux/commit/7b159ed9c81cf7e0d0b75666e6548ceface2e1b5

Thanks,
Inochi

