Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023621D3D2
	for <sophgo@lists.linux.dev>; Thu, 10 Jul 2025 04:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752123042; cv=none; b=V0IWrXP2B+cVm/e40oI03MP/fFpqUWghIv2L0ZUoW4phYaOT9l5Ttyd7bU2AVwuk42O6hf/C6+kWdZiCPofp1oPmI1r+zp2Lp8NPK3ABLt+vLPx5ylntmGwPkpVmm5mleI37vQmZUn/e4IpnyO4fkEGsTes37Y0Icv8+ftiQYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752123042; c=relaxed/simple;
	bh=nc4vZNDG2OHE21Q6Lxczi2c87J1YLsWFb2OwvQ+iHIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+i89ybMx3aHqnSjC7rf/YAFNFYWNtgnz6NMbcCZpjlrD3Xv99zoHf2h0C7auDbfN7QJcRUTwWT1aU3OtVPJnzu5qvukIJF19RE0rB+vmli1nk2pU2D7lt6iBpEYu0FYfzUS+EwX2uO7HA+KQRyCdmVXum8czBYoVHppaUtXbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWkvh52D; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWkvh52D"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so595013b3a.1
        for <sophgo@lists.linux.dev>; Wed, 09 Jul 2025 21:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123041; x=1752727841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtylixEBzO6jEVKuJIA6FfcGiADPfp9pum3boqegUFg=;
        b=iWkvh52DhCoiA8bUHmhvhwhI8x2+FLnHlen6YQkgBpfjgmRd1gIbEwHXcycD+cGYj/
         y5HgDfZOjnpKruqO0KFroPNs7z7IxTtM0MEMyWZNInFRfH3gBKOARZQ2MaeqqNJTdO2t
         QFyZyWYx0b4rFJefcNNtYtcc5X3jiAuSBRD1W4cQvP2IlOx52o2FUpcaxMiZxyzhiP4q
         zGukIx0L+YLK5zs5eV1C/+t5v42DOdwWxkweSR/LEAj98e7KGw8KkzJfd+vFZPAoxMCm
         AABuZkCxXkSwe3zGDa/2KJirz9mHZwZyOMewiNcURUV3EwyOKos6xLNsWJ7T8bSPN5jE
         kehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123041; x=1752727841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtylixEBzO6jEVKuJIA6FfcGiADPfp9pum3boqegUFg=;
        b=gYkRpvOUTtMZkROJfjFPVuTOKSHq+yf1d9g5NNCPMXeiJnJLIaKbYWpkPGpU9MpdEd
         8gUsjYOwtsRxIehRVczELMiCMrSZs94/122zGE+carTO2OuUhLkPsfMayuGxo51t3pWF
         TdipnYvfHb2BDVaDfIB4ev6SbYJkaUVDYw5NEcpBeuyQMB173pJKQ9gKiDcZvGmvf7WV
         sZt7JVQ9bQF6o13ltnpErGvfbvy7mluje+RbhMGIR6jduedcAXwq5XAcBzFqZV6/eQdv
         o7IQCuyzVIf6lkUWzzmPXUqDBLc9uT/PqgEbrAtbOGZzNoxbg9z4DTiwDfA7bzyIwf7w
         7qPw==
X-Forwarded-Encrypted: i=1; AJvYcCWeKhGJbEBMkZGzVpgBGHRp4dr8t1DQYEtqSXG8tjVkWPFQBgrZFVldwVcv57hhMi5/HQq04xw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCG7rFiHZW0xQnKS6mkAzDGTvU0G1I14AZ9s0HPj/q9HyCyaV3
	OavO3UywgevewBIzg73BFAwjF/BSdaOyFOTWAXysCwrhp6jkAcHxT64e
X-Gm-Gg: ASbGncukp4XvhKNkIPMbUk3oFsf3dQLJVFiFtHxhY2bd+1CHrBAU94UO8Z13ny61bEO
	Jxj0HvSYZ0qd9JR5JNoNx7TxzElMeKEAmKCL2s9O9B26d9p7mwjixocZbE27UCpj4HQUEpqbTBR
	CzECEjQrfBq7gItqcy4E5p8ZKBmIN6C940DBa/IxP+fPDWvBafv10q0HCTSIfZAuCePJJt3Djfo
	2UT33SEm2XYVBZ4OelzyFd4UZHqa6uJ9bnqaFfKamHomq/fSmkpzQjo2VmDWgJbhG5W55qqI1Kg
	gGB1CyfJ2Z9wn5VkFnDTmFd8iiGkxFWdburVH0Hm2/LsmlOw096qf9nVWustsg==
X-Google-Smtp-Source: AGHT+IHfDnnUa2iA/+iDRVSfbCQKkD4uhYVOacst5Po2qnE6YZro0V7CebitFaQ5OUOy24k6W92kxA==
X-Received: by 2002:a05:6a00:7595:b0:74a:cd4d:c0a6 with SMTP id d2e1a72fcca58-74eb593d16emr2726286b3a.5.1752123040554;
        Wed, 09 Jul 2025 21:50:40 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9dd7341sm854848b3a.15.2025.07.09.21.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:50:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: devicetree@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Thu, 10 Jul 2025 12:49:47 +0800
Message-ID: <175212292372.416883.14744071473341461158.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1751698574.git.rabenda.cn@gmail.com>
References: <cover.1751698574.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 05 Jul 2025 15:00:11 +0800, Han Gao wrote:
> Add xtheadvector & ziccrse & zfh for sg2042
> 
> Thanks,
> Han
> 

Applied to for-next, thanks!

[1/3] riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
      https://github.com/sophgo/linux/commit/d82362d92328c5391312df3a948077f5d651b598
[2/3] riscv: dts: sophgo: add ziccrse for sg2042
      https://github.com/sophgo/linux/commit/df5b30b7feef4a643e36fac74fa0e45c1b9f105a
[3/3] riscv: dts: sophgo: add zfh for sg2042
      https://github.com/sophgo/linux/commit/3eefd8e961cea639370df96b6553a52f638e02e8

Thanks,
Inochi

