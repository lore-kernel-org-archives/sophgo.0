Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04D4238141
	for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750136932; cv=none; b=BDueNtGQrOSoKVAk2pCy0Jt2MvrG4f6cNVQbI04gbGdTczaSaAVZUcrTIKUtuD99RX/BZwFfJJkthrZGskSxlQ8y01vZcyKTqXHEajM3IWPf+zwBGUX9F6Ng59e74GJcuzkuyCa0Vrt/aeeqnQO75CXF4a541OGPXvvyMkYmtr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750136932; c=relaxed/simple;
	bh=jn+AZcoS+gknzUx30CvE3/KJcpJXhjiNQQiH43qHxgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7ZpdGgk1hxIMYGAmpSzv0gKnDuswlp8MS7gjaxslxxsBrzu3m3LAkcIuf8DCExOd6qRjLaiMKOc5Vw+LNESlAoLmGbKfxJ6wP0q9ip6YNe64vGL1zvIo1byzeylwH0nai2iopVKiiD7Ne2+//cUUL9junKOf8PtikBkkeBEZeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evW2PHD8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evW2PHD8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so4963914a91.1
        for <sophgo@lists.linux.dev>; Mon, 16 Jun 2025 22:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750136930; x=1750741730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORQSZScH5iwOR20pfQirho3FdyqdaURMxGfN/YBE6uA=;
        b=evW2PHD8q7nUIdlb9PnUlaklcvCQGu4P7K4CAdPbl6T7BiCzXLdAqk4uS1z/YDFt7q
         Ka621Y85O8Ts3kqsrIhLcVBUIz6a6crjWU7c7OZAkuDQ02TizUITtC/T8tb4qzBuZHdl
         zqd8tfiV8Ldrt7KahcAaZtEdWVvYMNWvMpJ6FRVcAebTUxj9Gi5dAMeVMSqn1QC4ENGa
         OVJooybGXgoyNFzyXRxGIUmQoSinjbhxgNLA2bwaaO+kqaHuRCZBRt2YUq7XAnaBaQVK
         XVLxd+zbFC0oKhJ9JnqWwStO/ZcU8GT9RJG/9vWy52Gqw0h2Y+fbAObJ1dxpEbXdop7W
         Sorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136930; x=1750741730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORQSZScH5iwOR20pfQirho3FdyqdaURMxGfN/YBE6uA=;
        b=VozV/w95hypn4LyLloyBAnbTaCaICBm0TEa1zhior9+NZN0zx3E0wb6AU9CzFaaVuu
         g28uZEqJmlU8cJq9CoyPbRVmLhayzKMW60Ktfv2L4KWFiBYqIerRAXyL9UL2OGFdA2G4
         p1S2dPXs2Q7c6UKWlDgNtKZbsCP0Ad674s7ggXN1X5sj5mU3TqfGm+/0bDeEUkxS4t/O
         cWPk7ZlE/ydSQQDdFt0UH1xqrkjoyTPXOoZxytlmaLnohWuH9kqwNXQmXvx35+Nk5lSg
         93F2FKW9+DRDHCJQ4wa3wpjXVR9B8aTIJ+Nxki5P03P6y8ce1vW71oeDT+Su41IllXXe
         fOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLGbfP2FZuzJRTNab7gUoKjonmTeKca5FZ6LdF+PAiO/+VbHHZL+eX65Pa9XGh+IP7NERvOq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW19pgrBTfLTEeMzS0HqBoRVGrcPnj1Qk1bzIpWAjrIDKtVSLz
	m+pwwYFR1ww5o0HDHrpwnbGKHRYm09xInDQW5SjfVhrO2syoslL+i2CD
X-Gm-Gg: ASbGncut9YLjLLWPHfBp952ndOiFkhVQKrr3nqmFRQVw8rKFWsBbFvsdShfH/n7PzVD
	9m0QCPJk4pwaXzPFxGbVIIxZZUixLLVO99IzgTf6I6oOJfabu87ebZE5d09v9eVZNzVAbCFXh+i
	Xv7bE3M2BbzDr1LElx+r8E92HwljVw+/8HJZGlonmEVlO7CfcrmKUoX4Sf0qrAQJ53UKJdk+qSd
	AzUZWIH2wbT0flF8RdPLDhEqbWPahdYvm6e2L0nABraTv9mN7s5zNxTcf0+h8nmLGyA+nH7pSwJ
	Jz4R5SEQV9et2bMUtwxgv5rVM7D6Twb2n8z/KaVn67oJ+7fb5C4JklKu5RXdpQ==
X-Google-Smtp-Source: AGHT+IEqDf/C089XDze8DuijQXHRfftyr4C1u9LoRguwB27oUwZ29eFwHxr18ltua7GFqGz7HGzG5Q==
X-Received: by 2002:a17:90a:e7c2:b0:312:639:a062 with SMTP id 98e67ed59e1d1-313f1daa971mr21369290a91.16.1750136930150;
        Mon, 16 Jun 2025 22:08:50 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c19d1eafsm9712177a91.18.2025.06.16.22.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:08:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size property
Date: Tue, 17 Jun 2025 13:07:22 +0800
Message-ID: <175013680588.1018298.10559632401541865399.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613074513.1683624-1-inochiama@gmail.com>
References: <20250613074513.1683624-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 13 Jun 2025 15:45:12 +0800, Inochi Amaoto wrote:
> The kernel complains no "riscv,cbop-block-size" and disables the Zicbop
> extension. Add the missing property to keep it functional.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sg2044: Add missing riscv,cbop-block-size property
      https://github.com/sophgo/linux/commit/b8518378ffd3469b5ba871ee0210b3c16de45d66

Thanks,
Inochi

