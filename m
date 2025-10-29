Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B18B2F83BB;
	Wed, 29 Oct 2025 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761717505; cv=none; b=dVDDgpK4ZU626d3XpL96pMyiklWEOBK0g5u8Rb5Nb7PiWDQfyKGkEo0Wav+C8TnlVNqCOpMwlfHjsuzrOwRIzVfnXNfB1O8a9eCx1ZqR1lf0NCxEk5LZUVVJtrYOzNVBVa8XC+6frU17ylXoC0a5ZDXfT1/6ST12IY7eJSskT1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761717505; c=relaxed/simple;
	bh=LsZ1vHE8LISoCJXup6m2y/jZ7lCTlE9JnkLZJ+nsGzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ez6PfHS2Je65K1IGcP3qa6+EFKJc/2VFXQG6UB2mxZlsJcxoHpNRBQUYTG1+VToP8clnCOiORH/wCPqmMs63T8Ebd1QoYUUGkEqvBG9lfa/LkglfyS2GDSxyZ7vG9K5Rk9omOUqkmsyokRhK8fu3M2yNJz60HvsfRWCaUCa0eTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAJ/muu6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAJ/muu6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761F6C4CEF7;
	Wed, 29 Oct 2025 05:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761717505;
	bh=LsZ1vHE8LISoCJXup6m2y/jZ7lCTlE9JnkLZJ+nsGzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eAJ/muu6fYOzeweIFSbHTkQ+z16gj/rOD7Ap8GXMMI19Ct/8u40LmNL+9h4MAs6F4
	 a1oJXoE31rZDuE5ZRKdV5X9rptMYNsOM1GxLQg6aPEdKxWoIxWtjkdWId7f6lYvCIl
	 8lOwOzDGypOE4Qgkj3pPgLv8XRYy43c5xOo4J8wmZ00XpVkgtxSJxcz9zBOZxFRyki
	 TPcdNOQTTIPbrWlmeU7nb4trAVv6JAN2mJ487gq2WD5BxSMmQjE330a30f/76Eeb1D
	 dXeL8+okcXlUIlAYPDHnC12qHSkSL2yJ2Ijhr9Hc4HetXMBCfRuIsFCewHNBiqCqnh
	 BAgq6ZXG7Jdtw==
Date: Wed, 29 Oct 2025 06:58:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com, 
	paul.walmsley@sifive.com, samuel.holland@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <20251029-nebulous-doberman-of-wholeness-0fd3a5@kuoka>
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-2-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029001052.36774-2-josh.milas@gmail.com>

On Tue, Oct 28, 2025 at 08:10:48PM -0400, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board [1]
> which uses the SOPHGO SG2000 SoC [2].
> 
> Link: https://milkv.io/duo-s [1]
> Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]

Drop second link, not relevant. You are not adding new SoC here, are
you?

> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---

No changes against v2? You received comments, didn't you?

Best regards,
Krzysztof

