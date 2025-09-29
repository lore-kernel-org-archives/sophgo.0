Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE032AD3E;
	Mon, 29 Sep 2025 02:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759112049; cv=none; b=o5cyDnfwHl3s9SD0SDvDrVB8ZXdQpAmRb06dSZwWDRviPZKgoXvXReQzFZgjwdtCyK9bg7/8Y9Yf9P3tJpCItohQV+gv1w704BfkxgLz37nSXuC7BK/LYJxqL3e8S14pJS8Q94cquSqmVsPVElD4mqmsjh8pFkNCa8/bQZK0Whc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759112049; c=relaxed/simple;
	bh=YkAivuujF0wa+84kxUjj3ARg+Nn+qWZd6TXvKUr4GW4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RgbK9uS6vBHnF0PiS1GdV9D/oBzpZrVDB5mkZtgLl5o4OuTl+2X5NAVj7JhrForLncbHfunKs5hjGApWyDoNLTjk1iYRvg+sfKCvxizWiO3SyrBi0k3iXMRW9kIfXckHEZY/8nbc2AIxjjhA93rQa/E83WX0n5Kxh1cScxRxJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bG/DEqHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bG/DEqHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD96C4CEF0;
	Mon, 29 Sep 2025 02:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759112049;
	bh=YkAivuujF0wa+84kxUjj3ARg+Nn+qWZd6TXvKUr4GW4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bG/DEqHOwUO6+5PEuRkhBIgm+cMA3sfH4u67mVKMdeUknfj/IxdTMlZZDyaBE4/Pc
	 KGCEf+lS4uT6FhrX7up6ni3trwGaldLQOpCJkv/yUjow2WDqJ08YfBaQ7N58vXPB5r
	 uItS3RxkqsDpv64HRUYTsJ+QFhq4ysGG+IHDU/7h37U877dMgszttTVDABMmZ0GgVH
	 kGOdlbms0jwiH/nBP1dlRTPmWH7YQ3NI7fxVojKDPWrZKYefEb7oj++I7GAw/8Ui2o
	 Gx0nkP6PDXSJlg++twKqgT3wWWaFcaV04mhjSUVSk9kyb3plR67x/IrmZwsmyUM1aK
	 YEcazkCaKw7hA==
Date: Sun, 28 Sep 2025 21:14:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, unicorn_wang@outlook.com, krzk+dt@kernel.org, 
 rabenda.cn@gmail.com, alexander.sverdlin@gmail.com, 
 thomas.bonnefille@bootlin.com, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, inochiama@gmail.com, chao.wei@sophgo.com
To: Joshua Milas <josh.milas@gmail.com>
In-Reply-To: <20250927173619.89768-1-josh.milas@gmail.com>
References: <20250927173619.89768-1-josh.milas@gmail.com>
Message-Id: <175911189587.2556652.14764390640619439549.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add initial Milk-V Duo S board support


On Sat, 27 Sep 2025 13:36:17 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card. This is continued
> work from Michael Opdenacker's v6 series on the ARM64 side.
> I'm still working on confirming the RISCV side.
> 
> https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/
> 
> Patch produced against the "for-next" branch of the sophgo "linux" tree:
> https://github.com/sophgo/linux.git
> 
> Joshua Milas (2):
>   dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>   arm64: dts: sophgo: add initial Milk-V Duo S board support
> 
>  .../bindings/soc/sophgo/sophgo.yaml           |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 88 +++++++++++++++++++
>  3 files changed, 90 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> --
> 2.51.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250926 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/sophgo/' for 20250927173619.89768-1-josh.milas@gmail.com:

arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dtb: / (milkv,duo-s): compatible: 'oneOf' conditional failed, one must be fixed:
	['milkv,duo-s', 'sophgo,sg2000'] is too short
	'milkv,duo-s' is not one of ['milkv,duo']
	'milkv,duo-s' is not one of ['sophgo,huashan-pi']
	'milkv,duo-s' is not one of ['sipeed,licheerv-nano-b']
	'milkv,duo-s' is not one of ['milkv,pioneer', 'sophgo,sg2042-evb-v1', 'sophgo,sg2042-evb-v2']
	'milkv,duo-s' is not one of ['sophgo,srd3-10']
	'sophgo,cv1800b' was expected
	'sophgo,cv1812h' was expected
	'milkv,duo-module-01' was expected
	'sipeed,licheerv-nano' was expected
	'sophgo,sg2042' was expected
	'sophgo,sg2044' was expected
	from schema $id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#





