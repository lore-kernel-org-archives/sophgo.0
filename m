Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42013D7D77
	for <sophgo@lists.linux.dev>; Wed,  3 Jun 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780452692; cv=none; b=D0fX21hnCVH4QGP6Vd/AoINfyY6BN3cy9j54ZA6L5WZYmBah67OMFd1Dza49Y6wdlgNT1N9+Do8D+BcNO+i7Hu9oBfCgDfBAoUh7HecWerPwZFGdN8aOYVpxLrf7ZpcgF6+PpdvOedbxvOcG2vAXfI4lh1EnZdtVGPKa3zYMC/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780452692; c=relaxed/simple;
	bh=M6VqlQ++3QGcRoeR5pH8FA1zGjwooUP3N+Uy62I6rlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IuJ8sllHfjz69emhOkKd8ZSORvHcrlVFNGzYhXO1uS2Or/jwKw5lCbDvSRsr7ambh6UJaQ1AIrl26axqFQIjDT6vXf2/Ku9Peh0zviMkYW4EXktd57kscf+8oB+5YeP3FVWK6SKCYLY1gMZ4LfKf629/P2qT6IhrbhKknETK9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnRtK39W; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnRtK39W"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c35980fdso32423985ad.2
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 19:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780452690; x=1781057490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+L9YaFJ+m4ellFTarKqsN1ZQFZp0gqbz0P+NkIvUIc=;
        b=nnRtK39W4tkm4ftCIoXp/4XjR6ege23Nhe9zdPGkKvDZBRLx7mPuSBLUsr92AOdQCq
         brI9VNDWpU7pO9Hj4I7R6i2/lCOkucQk2QblAjNr51FSndWa/bbHoX/q7co04guttOyb
         appMd/lIBjqMjXIKPWI2jBrP+7cYbMTI73Pm+wjxrjXppLmk9gVTRUV4Sq/p3IVD0X4e
         WYF8wrncEkhF28dh9NncRuMLXHTy7thENaJZu1xfUC/lySUclJLvBRTAvDdzher81aqw
         OnoA9TjuwHIGp9eg/lphLQG3GiG5jL+ggvhPejSQjD/QK2yyVx2DSyxGkHxDsuakhTy/
         E9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780452690; x=1781057490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+L9YaFJ+m4ellFTarKqsN1ZQFZp0gqbz0P+NkIvUIc=;
        b=IqM4pKKXlUnvYnTY85MacEc6l+dToFkZXN7K3xlq6BGqmYCfZLC6L6EofQokP0OCdK
         VKSen7dfKkPqVp7D79OKovfrz76V11bTZATFC1mDHKUm8BQc6vska46YG6EY5LOQFJC/
         c0BQ0WZ8F5rNgVtsxfsTvZvKrDEVtH3ZeZhl0rtr7acfpcl/YfmPoLtCwmvL94QKyJ2b
         KMUxz8BhvnB3vdwTio88NC/Lm2nEjF5tInMbn+db20+l+weNYM9heZSqwB2wLi3J1+yF
         M43itK8qVPrtQoAe4QgCGQmROekeZBXY/lCcH6HnCPg23A8PaPn6/y8uGJNJ6vsQulMb
         2ZVA==
X-Forwarded-Encrypted: i=1; AFNElJ8RXj397Wo0CvCJpMRIqi0EQWfyIhadorFx7sozstohBWoFE7gg7bI1eiqA6WhQwncVq0pDu+8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxX3krzIwz+y+ay9jU5KFyq9JrqCJncGdYSRjy54+JvyR/PQ0Iu
	LgzBRmOr3ykNeP7jg204GESMRSfAQxaatkTwITQNHbBgT1UG8JFpRAfR
X-Gm-Gg: Acq92OGViGdsN9U2LZHEs7VWCdDujI4Xx//hJ0QLAo+WqU9hWn593ajIZqErGJwsSPT
	fpC1tycQ6pUo1aAiyQlVckQm3Nl20+NOklG+Q0Y9oG63D4+8sCTUb7lrp7aNtyJqqdGZaqaZxG7
	AwIzVPqo89o0gVTOCbLjTYE6mnEmxI8Dgp/XR3c4lBvD/gGYY2l+vZDj1V6nLWQ4d5mAtZQRBmw
	6me7fmG2tHQp6QJOdyegluFo4FenGBIOvC2uBdzpaYCzQDpWFigqTNcZnBhhzETMsbQdP3z0FEV
	fjMGIeS5xrxQAwbILGLzKxZToNbew5+KhKRN0RWP5arEJjWHMF8YeMp0kJcWS+4QU+0f2eOxCbH
	mfAa8pjxBjcTL47Axk6XbLyVHRiaIV/RFiI8rHXnu9eHqqKgUXKq/t3/9b11944njsogCQpaaXL
	p3VH/TnYgxQG3xF0FMuHW2gYNf2bivX07BVg==
X-Received: by 2002:a17:902:e851:b0:2bf:82c:6322 with SMTP id d9443c01a7336-2c1639eded3mr14290625ad.3.1780452690145;
        Tue, 02 Jun 2026 19:11:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm6305885ad.11.2026.06.02.19.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:11:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: reduce SG2042 MSI count to 16
Date: Wed,  3 Jun 2026 10:10:49 +0800
Message-ID: <178045263171.227355.8295224665627411486.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
References: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 08 Apr 2026 00:01:43 +0800, Icenowy Zheng wrote:
> The SG2042 MSI controller has one 32-bit doorbell register, and each bit
> corresponds to an interrupt. At a glance, it seems that the MSI
> controller can support 32 interrupts; however the PCI MSI capability
> only supports 16-bit messages, which makes the high 16 interrupts
> unusable in such way.
> 
> Reduce the MSI count to 16 to prevent producing MSI message values that
> cannot fit 16-bit integers.
> 
> [...]

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: reduce SG2042 MSI count to 16
      https://github.com/sophgo/linux/commit/903a9364e40563faf4730dc63ad7446246f494ff

Thanks,
Inochi

