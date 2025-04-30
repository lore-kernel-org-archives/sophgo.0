Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A82F5B
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993500; cv=none; b=NvcwLgXRqnYAWGGX23rm1KbCDas7jMYqNF+klRVE9rt/+1xXy1lptSS7AJMYB7o36AR1D/Uh15EA1kRTFmLphm24w1rrn+sk//ms7eiGT9nNNqBp3B7ZdvXM5C+Za5g5raj/TVVTtgrA5/4CVTozLfAtQnklz3zOQzAq5We2VMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993500; c=relaxed/simple;
	bh=v1pIsxP6g51VyfRbw0KYK/eHIg7gjK0YTemiE8HpC5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9475IWs1mC4GsPPZditAnamQPu6k9rZv3nt9uYzMHmaNtmdLvrXp5mdb5ql4zZGPZ7qBg/48K7ek0VDuQiUAY7chuISWqG4eZGJyM5zdgym1NFFNlweqejM1ED5Pi6A513RcXsBws+9oJNF8vA7TxYnSEJDLLkJyds7tZ99SbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtizIKY0; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtizIKY0"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47690a4ec97so82562891cf.2
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 23:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745993497; x=1746598297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7Sx1WcG8f/lEhG1xD4WO6e65BUg4XMEnaaFpCgdP74=;
        b=gtizIKY0/u3dssLukLkQ6icQn8Efu45I/DJVWqkWrIpXSrtp2VpIcsC3EChCFpZ+Xj
         8byI1Eki3mR/RmLqV4wUVG2+6sDA8eJM/ut2KKjXqRcwnSt09j2J1Wl0vvv0M8cycTvX
         neLOPGfSlWcdkdtZvCIqmaQpVeDQY10htE3/GqbFLMi8+7ZwtIjIMdTOj4+SMwnX4HwS
         zWoT7eS7tiFs+V0s/5uOMU67/ACtooShFi5gcH3ZplEX1cNr/mBG9CEuBkmMTjUczVUh
         wXSgoett7NUscHEsM6nRB8u4J8tBMyyDtIMkpnwXlMNTc/vQ0ol7ciZi9t+vNjZw1bBd
         E5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993497; x=1746598297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7Sx1WcG8f/lEhG1xD4WO6e65BUg4XMEnaaFpCgdP74=;
        b=etfEFsKAzz/YRpVQoBqnYVFLAcsePdpLos8PLlqG+vl8JLZVMrTgHkZhRN2JdJJpU+
         lYCgczO9/xlqYgMnu/SVMLRWQ6DFmZEQjPOiKGNxP07tLwTs7RCfaxnNFLSwxLo5tmvM
         yGlVISgPi6pghTPwmUisMa7wwI+q02KMUrqyalOnrJNRITVRVNQZ2jjfh4qcWlCKWRJY
         vQpoTZHqF/xaGt6oocXbweY2faH2FT/UnG9fRqI3iRlr+EXvsxp2e8tKhG1cJFXfnSgV
         l2P+SCYXzgg2hFhrB0cJm5nROLOEKVqznC9WSAZEhUKm/ASMmSKDKBw2dwlKvScTppqr
         EK8w==
X-Forwarded-Encrypted: i=1; AJvYcCUu9fi1JliXYZcxTpGju0VDzlVQ1qs0MVF7tvP30gKBcpAvOfadG0OtzNaJR0tXxyEbj8BGh38=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSKSEAXOpZav1nLEcrG/ejpAf7GRGpFLaxlL7n6kLjryO68wLw
	wY4ql9H39d7w74vK7IY//58poJYIdmB4JqRW++w2wctklKatUBQ7
X-Gm-Gg: ASbGncus5gVy6N9RdkqwjmQAzv8IOV5+zo4oKYV8xoiVq8vV7auTq7UAI59Itf9D++r
	/zYRBipTClTN/WXogjc5oRg7/s1sEUsO+p4hFrVMWpWMUT9y5+6HAEFHeB92wqlkFuL/dyCb2K+
	Ty6Fkd4gFxYHn3Gogsr4m1JQWXj1PKKGMYOdIY5UQJk21Bkv+ngKmWVlz10rTzAgryLBDWbJnMe
	il4hZ9ebl+5iAkKuOvRBbQ5RlGmlwADrMVu9Ypagyafr0hHs7uRhdvPbJszm1gYpI7SyiIWFeEF
	tD4XC6Knw/yiOoTK
X-Google-Smtp-Source: AGHT+IGs1P+XfC/zsF9LCXLoh8Go5qSMxvWRH8PVyfFT1zFItCSZlKafKUoX4M940mVzPotcHqa3cQ==
X-Received: by 2002:ac8:6f09:0:b0:476:63e5:eb96 with SMTP id d75a77b69052e-489c4169351mr35148251cf.28.1745993497561;
        Tue, 29 Apr 2025 23:11:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9f5b4f0asm88406361cf.33.2025.04.29.23.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:11:37 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huange@whut.edu.cn>
Subject: Re: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for CV18xx
Date: Wed, 30 Apr 2025 14:11:19 +0800
Message-ID: <174599347430.640588.3561713391476977843.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
References: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 28 Apr 2025 17:24:36 +0800, Ze Huang wrote:
> The "snps,data-width" property[1] defines the AXI data width of the DMA
> controller as:
> 
>     width = 8 × (2^n) bits
> 
> (0 = 8 bits, 1 = 16 bits, 2 = 32 bits, ..., 6 = 512 bits)
> where "n" is the value of "snps,data-width".
> 
> [...]

Applied to fixes, thanks!

[1/1] riscv: dts: sophgo: fix DMA data-width configuration for CV18xx
      https://github.com/sophgo/linux/commit/32b3f9d3e57bb4bd2204a6a4305b9f899f725859

Thanks,
Inochi

